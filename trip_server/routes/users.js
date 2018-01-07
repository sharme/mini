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


router.get('/getUserbyUID', function (req, res, next) {

  var SQL = mysql.format("select u_id, u_name, u_avatar, u_gender, u_city, u_level, u_created_time," +
      "(select count(t_id) from trips as tr where tr.u_id = ur.u_id) as t_count," +
      "(select count(t_id) from likes as ll where ll.u_id = ur.u_id) as l_count from users as ur where ur.u_id = ?", [req.param('u_id')]);

    connection.query(SQL, function (err, result) {
        if(err) {
            // res.send("{errCode: 001, result: there is no results}");
            res.send(err);
        } else {
            res.send(result);
        }
    })

});







module.exports = router;
