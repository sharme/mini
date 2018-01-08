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

router.get('/getList', function (req, res, next) {

    var SQL = "";
    if(!req.param('u_id')){

         SQL = mysql.format("select t_id, u_id, (select u_avatar from users as usr where usr.u_id = tr.u_id) as u_avatar," +
            " (select u_name from users as usr where usr.u_id = tr.u_id) as u_name," +
             "(select u_city from users as usr where usr.u_id = tr.u_id) as u_city," +
             "(select count(t_id) from likes as ll where ll.t_id = tr.t_id) as t_vote," +
            "t_view, t_title, t_content, t_pic1, t_pic2, t_pic3, t_location, DATE_FORMAT(t_created_time,'%Y-%c-%d %H:%i') as t_created_time from trips as tr");

    } else {
         SQL = mysql.format("select t_id, u_id, (select u_avatar from users as usr where usr.u_id = tr.u_id) as u_avatar," +
            " (select u_name from users as usr where usr.u_id = tr.u_id) as u_name," +
             "(select u_city from users as usr where usr.u_id = tr.u_id) as u_city," +
             "(select count(t_id) from likes as ll where ll.t_id = tr.t_id) as t_vote," +
             " (select t_id from likes as ll where ll.u_id =? and ll.t_id = tr.t_id) as u_like," +
            "t_view, t_title, t_content, t_pic1, t_pic2, t_pic3, t_location, DATE_FORMAT(t_created_time,'%Y-%c-%d %H:%i') as t_created_time from trips as tr", [req.param('u_id')]);

    }


    connection.query(SQL, function (err, result) {
        if(err) {
            // res.send("{errCode: 001, result: there is no results}");
            res.send(err);
        } else {
            res.send(result);
        }
    })
});

router.get('/getListbyUID', function (req, res, next) {

    var SQL = mysql.format("select t_id, u_id, (select u_avatar from users as usr where usr.u_id = tr.u_id) as u_avatar," +
        " (select u_name from users as usr where usr.u_id = tr.u_id) as u_name," +
        "(select u_city from users as usr where usr.u_id = tr.u_id) as u_city," +
        "(select count(t_id) from likes as ll where ll.t_id = tr.t_id) as t_vote," +
        "t_view, t_title, t_content, t_pic1, t_pic2, t_pic3, t_location, DATE_FORMAT(t_created_time,'%Y-%c-%d %H:%i') as t_created_time from trips as tr where tr.u_id = ?",[req.param('u_id')]);

    connection.query(SQL, function (err, result) {
        if(err) {
            res.send(err);
        } else {
            res.send(result);
        }
    })

});

router.get('/getLikeListbyUID', function (req, res, next) {

    var SQL = mysql.format("select t_id, u_id, (select u_avatar from users as usr where usr.u_id = tr.u_id) as u_avatar," +
        " (select u_name from users as usr where usr.u_id = tr.u_id) as u_name," +
        "(select u_city from users as usr where usr.u_id = tr.u_id) as u_city," +
        "(select count(t_id) from likes as ll where ll.t_id = tr.t_id) as t_vote," +
        "t_view, t_title, t_content, t_pic1, t_pic2, t_pic3, t_location, DATE_FORMAT(t_created_time,'%Y-%c-%d %H:%i') as t_created_time from trips as tr where tr.t_id in (select t_id from likes as ll where ll.u_id =?)", [req.param('u_id')]);


    connection.query(SQL, function (err, result) {
        if(err) {
            res.send(err);
        } else {
            res.send(result);
        }
    })


});

module.exports = router;
