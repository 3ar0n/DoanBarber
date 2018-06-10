var express = require('express');

var accountModel = require('../models/accountModel');

var router = express.Router();

router.get('/login', (req, res) => {
    res.render('account/login');
});

router.post('/login', (req, res) => {
    var user = {
        username: req.body.username,
        password: req.body.rawPWD
    };

    accountModel.login(user).then(rows => {
        if (rows.length > 0) {
            var vm = {
                showError: true,
                errorMsg: 'Logined'
            };
            res.render('account/login', vm);

        } else {
            var vm = {
                showError: true,
                errorMsg: 'Login failed'
            };
            res.render('account/login', vm);
        }
    });
});

module.exports = router;