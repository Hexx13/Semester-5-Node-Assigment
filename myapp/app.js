var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var validator = require('validator');


var indexRouter = require('./routes/index');
// import
var indexRouter2 = require('./routes/index2');


var usersRouter = require('./routes/users');
const mysql = require("mysql");

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);

// use the route
app.use('/index2', indexRouter2);

app.use('/users', usersRouter);


app.post('/login', function (req, res) {

    // catch the username that was sent to us from the jQuery POST on the index.ejs page
    let us = req.body.username;
    let ps = req.body.passwordd;

    // Print it out to the NodeJS console just to see if we got the variable.
    console.log("User name = " + us);


    // Remember to check what database you are connecting to and if the
    // values are correct.
    let mysql = require('mysql');
    let connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'assignment'
    });

    connection.connect();

    // This is the actual SQL query part

        connection.query("select * from login where username='" + us + "' AND password='" + ps + "'", function (error, results, fields) {
                if (error) throw error;
                if (results.toString() == "") res.send(false);
                else {
                    console.log('The result is ', results[0].acctype);
                    // send back the acc type to the client side
                    res.send(results[0].acctype);
                }

            }
        );



    connection.end();

});

app.post('/register', function (req, res) {

    // catch the username that was sent to us from the jQuery POST on the index.ejs page
    let username = req.body.username;
    let password = req.body.password;

    // Print it out to the NodeJS console just to see if we got the variable.
    console.log("User name = " + username, "Password " + password);


    // Remember to check what database you are connecting to and if the
    // values are correct.
    let mysql = require('mysql');
    let connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'assignment'
    });

    connection.connect();

    // This is the actual SQL query part
    connection.query("INSERT INTO `assignment`.`login` (`username`, `password`) VALUES ('" + username + "', '" + password + "');", function (error, results, fields) {
            //TODO Handle incorrect username/password or server crashes
            if (error) throw error;
            console.log('The result is ', results);

            // send back the acc type to the client side
            res.send('index');
        }
    );

    connection.end();


});

app.post('/cart', function (req, res) {

    // catch the username that was sent to us from the jQuery POST on the index.ejs page
    let num = req.body.number;

    // Print it out to the NodeJS console just to see if we got the variable.
    //console.log("User name = "+username);


    // Remember to check what database you are connecting to and if the
    // values are correct.
    let mysql = require('mysql');
    let connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'assignment'
    });

    connection.connect();

    // This is the actual SQL query part
    connection.query("select * from product", function (error, results, fields) {
            if (error) throw error;
            console.log('The result is ', results);

            // send back the acc type to the client side
            res.send(results);
        }
    );

    connection.end();

});

app.post('/placeorder', function (req, res) {

    // catch the username that was sent to us from the jQuery POST on the index.ejs page
    var cart = req.body.cart;

    // Print it out to the NodeJS console just to see if we got the variable.
    console.log("cart = " + cart);


    // Remember to check what database you are connecting to and if the
    // values are correct.
    var mysql = require('mysql');
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'assignment'
    });

    connection.connect();

    // This is the actual SQL query part
    connection.query("INSERT INTO `assignment`.`orders` (`ordercontent`) VALUES ('" + cart + "');", function (error, results, fields) {
            if (error) throw error;

        }
    );

    connection.end();


});

app.post('/buildproducttable', function (req, res) {
    // catch the username that was sent to us from the jQuery POST on the index.ejs page


    var content = '<table data-role="table" id="table-column-toggle"  class="ui-responsive table-stroke">' +
        '<thead>' +
        '<tr>' +
        '<th data-priority="2">ID</th>' +
        '<th>Product Name</th>' +
        '<th data-priority="3">Quantity</th>' +
        '<th data-priority="5">Price</th>' +
        '</tr>' +
        '</thead>' +
        '<tbody>';


    var col = req.body.colll;
    var table = req.body.tablll;
    var val = req.body.valll;
    // Print it out to the NodeJS console just to see if we got the variable.
    console.log("Table = " + table);
    console.log("Column = " + col);
    console.log("value = " + val);

    // Remember to check what database you are connecting to and if the
    // values are correct.
    var mysql = require('mysql');
    var connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'assignment'
    });

    connection.connect();

    // This is the actual SQL query part
    let query = "select * from product";
    var buffer = '';


    connection.query(query, function (error, results, fields) {
            if (error) throw error;


            for (var i = 0; i < results.length; i++) {
                content += '<tr>' +
                    '<th>' + results[i].id + '</th>' +
                    '<td>' + results[i].name + '</td>' +
                    '<td>' + results[i].quantity + '</td>' +
                    '<td>' + results[i].price + '</td> </tr>';

            }
            content += "</tbody></table>";


            // send back the acc type to the client side
            res.send(content);
        }
    );

    connection.end();

});

app.post('/buildorder', function (req, res) {
    // getting jsons from index.ejs
    let quansJSON = req.body.quanjson;
    let idsJSON = req.body.idjson;

    //parsing jsons
    let quans = JSON.parse(quansJSON);
    let ids = JSON.parse(idsJSON);

    //html for the checkout order table
    let table =
        '<thead>' +
        '<tr>' +
        '<th data-priority="2">ID</th>' +
        '<th><abbr title="Product name">Product Name</abbr></th>' +
        '<th data-priority="3">Quantity</th>' +
        '<th data-priority="5">Price</th>' +
        '</tr>' +
        '</thead>' +
        '<tbody>';

    //database
    let mysql = require('mysql');
    let connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'assignment'
    });
    connection.connect();

    //Query
    let query = "select * from product";

    // Query execution
    connection.query(query, function (error, results, fields) {
            if (error) throw error;
            ids.forEach(function (itemCurrent, index, array) {
                let i = itemCurrent - 1;
                let quantity = quans[index];

                //Adding individual items to table
                table += '<tr>' +
                    '<th>' + results[i].id + '</th>' +
                    '<td>' + results[i].name + '</td>' +
                    '<td>' + quantity + '</td>' +
                    '<td>' + (results[i].price * quantity).toFixed(2) + '</td> </tr>';
            });
            table += "</tbody>";

            //Sending data back to html
            res.send(table);
        }
    );

    // send back the acc type to the client side

    connection.end();
});

app.get('/cooktable', function (req, res) {


    // Remember to check what database you are connecting to and if the
    // values are correct.
    let mysql = require('mysql');
    let connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'assignment'
    });

    connection.connect();

    let buffer = " ";

    // This is the actual SQL query part
    connection.query("select * from product", function (error, results, fields) {
            if (error) throw error;

            results.forEach(function (element, index, array) {
                let inID = 'cookProd' + element.id;
                let labID = 'cooklabel'+ index;
                console.log(inID);
                buffer +=
                    '<label for="number-2" id="'+labID+'">' + element.name + '</label>' +
                    '<input type="number" data-clear-btn="true" name="product" id="'+inID+'" value="' + element.quantity + '">'+
                '<button onclick="changeQuantity(&#39;'+inID+'&#39;,&#39;'+labID+'&#39; )"> Change Quantity </button>';
            });
            // send back the acc type to the client side
            res.send(buffer);
        }
    );

    connection.end();

});

app.post('/updateCook',function(req,res) {



    let qanty = req.body.quanty;
    let nameyy = req.body.namey;

    console.log("ID IS " + nameyy);
    console.log("QUANTITY "  + qanty);

    // Remember to check what database you are connecting to and if the
    // values are correct.
    let mysql = require('mysql');
    let connection = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'assignment'
    });

    connection.connect();

    // This is the actual SQL query part
    connection.query("UPDATE `product` SET quantity='"+qanty+"' WHERE  name='"+nameyy+"';", function (error, results, fields) {
            if (error) throw error;
            res.send(null);
        }
    );
    connection.end();
});

// catch 404 and forward to error handler
app.use(function (req, res, next) {
    next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});


module.exports = app;
