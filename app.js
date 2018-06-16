const express = require('express');
const exphbs = require('express-handlebars');
const express_handlebars_sections = require('express-handlebars-sections');
const path = require('path');
const bodyParser = require('body-parser');
const session = require('express-session');
const MySQLStore = require('express-mysql-session')(session);
var wnumb = require('wnumb');


// Controllers
const   accountController = require('./controllers/accountController'),
        cartController = require('./controllers/cartController'),
        homeController = require('./controllers/homeController'),
        productController = require('./controllers/productController'),
        categoryController = require('./controllers/categoryController');

// Middle-wares
const   handleLayoutMDW = require('./middle-wares/handleLayout'),
        handle404MDW = require('./middle-wares/handle404'),
        restrict = require('./middle-wares/restrict');
const app = express();
const port = 3000;

app.engine('hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: 'views/_layouts/',
    helpers: {
        section: express_handlebars_sections(),
        number_format: n => {
            var nf = wnumb({
                thousand: ','
            });
            return nf.to(n);
        }
    }
}));
app.set('view engine', 'hbs');

app.use(express.static(path.resolve(__dirname, 'public')));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

// Config session

var sessionStore = new MySQLStore({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '',
    database: 'barbershop',
    createDatabaseTable: true,
    schema: {
        tableName: 'sessions',
        columnNames: {
            session_id: 'session_id',
            expires: 'expires',
            data: 'data'
        }
    }
});

app.use(session({
    key: 'session_cookie_name',
    secret: 'session_cookie_secret',
    store: sessionStore,
    resave: false,
    saveUninitialized: false
}));

app.use(handleLayoutMDW);

// -----------

app.get('/', (req, res) => {
    res.redirect('/home');
});

app.use('/home', homeController);
app.use('/account', accountController);
app.use('/category', categoryController);
app.use('/cart', restrict, cartController);
app.use('/product', productController);

app.use(handle404MDW);

app.listen(port, () => {
    console.log("Serving on port " + port);
});