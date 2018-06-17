var express = require('express');
var bookModel = require('../models/bookModel');
var accountModel = require('../models/accountModel');

var router = express.Router();

router.get('/', (req, res) => {
    accountModel.load(req.session.user).then(rows => {
        var vm = {
            User: req.session.user
        };
        res.render('book/bookingForm', vm);
    });
    //res.render('book/bookingForm');
});

module.exports = router;