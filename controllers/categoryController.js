var express = require('express');
var categoryModel = require('../models/categoryModel');

var router = express.Router();

router.get('/', (req, res) => {
    categoryModel.loadAll().then(rows => {
        var vm = {
            categories: rows
        };
        res.render('category/index', vm);
    });
});

router.get('/add', (req, res) => {
    var vm = {
        showAlert: false
    };
    res.render('category/add', vm);
});

router.post('/add', (req, res) => {
    categoryModel.add(req.body).then(value => {
        var vm = {
            showAlert: true
        };
        res.render('category/add', vm);
    }).catch(err => {
        res.end('fail');
    });
});

router.get('/delete', (req, res) => {
    var vm = {
        catId: req.query.id
    }
    res.render('category/delete', vm);
});

router.post('/delete', (req, res) => {
    categoryModel.delete(req.body.catId).then(value => {
        res.redirect('/category');
    }).catch(err => {
        res.end('fail');
    });
});

router.get('/edit', (req, res) => {
    categoryModel.single(req.query.id).then(c => {
    	// console.log(c);
        var vm = {
            Category: c
        };
        res.render('category/edit', vm);
    });
});

router.post('/edit', (req, res) => {
    categoryModel.update(req.body).then(value => {
        res.redirect('/category');
    }).catch(err => {
        res.end('fail');
    });
});


module.exports = router;