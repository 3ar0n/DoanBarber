var database = require('../database/db');

exports.login = user => {
    var sql = `select * from users where username = '${user.username}' and password = '${user.password}'`;
    return database.load(sql);
}