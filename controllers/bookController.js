var express = require('express');
var bookModel = require('../models/bookModel');

var router = express.Router();

router.get('/', (req, res) => {
    res.render('book/bookingForm');
});

module.exports = router;