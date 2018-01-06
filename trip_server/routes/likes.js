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

    var SQL = mysql.format("insert into likes(u_id,t_id,l_created_time,l_created_by,l_updated_time,l_updated_by)" +
        " values(?,?,?,?,?,?);", [req.body.u_id, req.body.t_id, date, req.body.l_created_by, date, req.body.l_updated_by]);

    connection.query(SQL, function (err, result) {
        if(err) {
            res.send(err);
        } else  {
            res.send(result);
        }
    })

});

router.get("/getLikes", function (req, res, next) {

    var SQL = mysql.format("select t_id from likes where u_id = ?", [req.param('u_id')]);

    connection.query(SQL, function (err, result) {
        if(err) {
            res.send(err);
        } else  {
            res.send(result);
        }
    })

});


router.get("/check", function (req, res, next) {

    var SQL = mysql.format("select t_id from likes where u_id = ? and t_id = ?", [req.param('u_id'), req.param('t_id')]);

    connection.query(SQL, function (err, result) {
        if(err) {
            res.send(err);
        } else  {
            res.send(result);
        }
    })

});






module.exports = router;