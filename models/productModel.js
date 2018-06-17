var database = require('../database/db');
var config = require('../config/config');

exports.loadAll = () => {
    var sql = `select * from products`;
    return database.load(sql);
}

exports.loadAllByCat = (catId, offset) => {
    var sql = `select * from products where CatID = ${catId} limit ${config.ITEMS_PER_PAGE} offset ${offset}`;
    return database.load(sql);
}

exports.countByCat = catId => {
	var sql = `select count(*) as total from products where CatID = ${catId}`;
    return database.load(sql);
}

exports.single = proId => {
    var sql = `select * from products where ProId = ${proId}`;
    return database.load(sql);
}