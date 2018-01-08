var express = require('express');
var router = express.Router();
var mysql = require('mysql');

var connection = mysql.createConnection({
    host: '127.0.0.1',
    user: 'root',
    password: 'fm@youtumi',
    database: 'fmyoutu'
});

connection.connect();


var date = new Date();

router.post('/add',  function (req, res, next) {

    var SQL = mysql.format("insert into news(n_from, n_to, n_type, n_content, n_created_time, n_created_by)" +
        " values(?,?,?,?,?,?);", [req.body.n_from, req.body.n_to, req.body.n_type, req.body.n_content, date, req.body.n_created_by]);

    console.log(SQL);

    connection.query(SQL, function (err, result) {
        if(err) {
            res.send(err);
        } else  {
            res.send(result);
        }
    })

});



router.get('/getNews',  function (req, res, next) {

    var SQL = mysql.format("select n_id, (select u_avatar from users where u_id = nw.n_from) as n_avatar," +
        " (select u_name from users where u_id = nw.n_from ) as n_from," +
        "(select u_name from users where u_id = nw.n_to) as n_to, n_type, n_content, DATE_FORMAT(n_created_time,'%Y-%c-%d %H:%i') as n_created_time, n_created_by, n_updated_time, n_updated_by from news as nw where nw.n_to = ?", [req.param('n_to')]);

    connection.query(SQL, function (err, result) {
        if(err) {
            res.send(err);
        } else  {
            res.send(result);
        }
    })

});



router.post('/consume',  function (req, res, next) {

    var SQL = mysql.format("update news set n_updated_time = ?, n_updated_by = ? where n_id = ?", [date, req.body.n_updated_by, req.body.n_id]);

    console.log(SQL);

    connection.query(SQL, function (err, result) {
        if(err) {
            res.send(err);
        } else  {
            res.send(result);
        }
    })

});









module.exports = router;