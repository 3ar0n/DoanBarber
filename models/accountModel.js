var database = require('../database/db');

exports.login = user => {
    var sql = `select * from users where username = '${user.username}' and password = '${user.password}'`;
    return database.load(sql);
}

exports.add = user => {
    var sql = `insert into users(username, password, type, block, opendate, fullname, phone, email, address) values('${user.username}', '${user.password}', '${user.type}', '${user.block}', '${user.opendate}', '${user.fullName}', '${user.phone}', '${user.email}', '${user.address}')`;
    return database.save(sql);
}

exports.load = user => {
    var sql = `select * from users where username = '${user.username}'`;
    return database.load(sql);
}

exports.update = user => {
    var sql = `update users set fullname = '${user.fullname}', phone = '${user.phone}', address = '${user.address}', password = '${user.password}' where username = ${user.username}`;
    return database.save(sql);
}