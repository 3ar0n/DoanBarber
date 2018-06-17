var express = require('express');
var serviceModel = require('../models/serviceModel');
var config = require('../config/config');


var router = express.Router();

router.get('/byCat/:catId', (req, res) => {
    var catId = req.params.catId;

    var page = req.query.page;
    if (!page) {
        page = 1;
    }

    var offset = (page - 1) * config.ITEMS_PER_PAGE;

    var s1 = serviceModel.loadAllByCat(catId, offset);
    var s2 = serviceModel.countByCat(catId);
    Promise.all([s1, s2]).then(([sRows, countRows]) => {
        var total = countRows[0].total;
        var nPages = total / config.ITEMS_PER_PAGE;
        if (total % config.ITEMS_PER_PAGE > 0) {
            nPages++;
        }

        var numbers = [];
        for (i = 1; i <= nPages; i++) {
            numbers.push({
                value: i,
                isCurPage: i === +page
            });
        }

        var vm = {
            services: sRows,
            noServices: sRows.length === 0,
            page_numbers: numbers
        };
        res.render('service/byCat', vm);
    });
});

router.get('/detail/:serId', (req, res) => {
    var serId = req.params.serId;
    serviceModel.single(serId).then(rows => {
        if (rows.length > 0) {
            var vm = {
                services: rows[0]
            }
            res.render('service/detail', vm);
        } else {
            res.redirect('/');
        }
    });
});

module.exports = router;