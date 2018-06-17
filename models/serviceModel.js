var database = require('../database/db');
var config = require('../config/config');

exports.loadAll = () => {
    var sql = `select * from services`;
    return database.load(sql);
}

exports.loadAllByCat = (catId, offset) => {
    var sql = `select * from services where catID = ${catId} limit ${config.ITEMS_PER_PAGE} offset ${offset}`;
    return database.load(sql);
}

exports.countByCat = catId => {
    var sql = `select count(*) as total from services where catID = ${catId}`;
    return database.load(sql);
}

exports.single = serId => {
    var sql = `select * from services where serID = ${serId}`;
    return database.load(sql);
}