var database = require('../database/db');
var config = require('../config/config');

exports.loadAll = () => {
    var sql = 'select * from products';
    return database.load(sql);
}

exports.loadAllByCat = (catId, offset) => {
    var sql = `select * from products where CatID = ${catId} limit ${config.PRODUCTS_PER_PAGE} offset ${offset}`;
    return db.load(sql);
}

exports.countByCat = catId => {
	var sql = `select count(*) as total from products where CatID = ${catId}`;
    return db.load(sql);
}

exports.single = proId => {
    var sql = `select * from products where ProId = ${proId}`;
    return db.load(sql);
}