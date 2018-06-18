var express = require('express');
var bookModel = require('../models/bookModel');
var accountModel = require('../models/accountModel');

var router = express.Router();

router.get('/', (req, res) => {
    accountModel.load(res.locals.layoutVM.curUser).then(rows => {
        if (rows.length > 0) {
            var vm = {
                User: rows[0]
            };
            res.render('book/bookingForm', vm);
        } else {
            res.redirect('/');
        }
    });
    //res.render('book/bookingForm');
});

router.post('/', (req, res) => {
    res.redirect('/');
});

module.exports = router;