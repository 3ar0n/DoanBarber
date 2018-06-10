var database = require('../database/db');

exports.loadAll = () => {
    var sql = 'select * from products';
    return database.load(sql);
}