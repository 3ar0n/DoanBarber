const express = require('express');
var categoryModel = require('../models/categoryModel');

const router = express.Router();

router.get('/', (req, res) => {
    res.render('home/index');
});

router.get('/about', (req, res) => {
    res.render('home/about');
});

module.exports = router;

