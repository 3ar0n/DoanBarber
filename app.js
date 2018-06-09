const express = require('express');
const exphbs = require('express-handlebars');
const express_handlebars_sections = require('express-handlebars-sections');
const path = require('path');

const productsModel = require('./models/productsModel');

const app = express();
const port = 3000;

app.engine('hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: 'views/_layouts/',
    helpers: {
        section: express_handlebars_sections(),
        // number_format: n => {
        //     var nf = wnumb({
        //         thousand: ','
        //     });
        //     return nf.to(n);
        // }
    }
}));
app.set('view engine', 'hbs');

app.use(express.static(path.resolve(__dirname, 'public')));

app.get('/', (req, res) => {
    res.redirect('/home');
});

app.get('/home', (req, res) => {
    // res.render('main');
    res.send("Home");
});

app.get('/login', (req, res) => {
    res.render('account/login');
});

app.get('/register', (req, res) => {
    res.render('account/register');
});



app.listen(port, () => {
    console.log("Serving on port " + port);
});