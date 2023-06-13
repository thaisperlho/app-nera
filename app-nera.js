//Configs padrões
const express = require("express");
const session = require("express-session");
const app = express();
const handlebars = require('express-handlebars');
const bodyParser = require('body-parser');
const User = require('./models/User');
const Questao = require('./models/questao');

//Configs da sessão
app.use(session({
    name: 'teste',
    secret: 'adsadsadsdasaadadss',
    resave: false,
    saveUninitialized: true,
    cookie: {
        maxAge: (1000 * 60 * 100)
    }
}));

// carregando o cabeçalho do html em outras páginas

app.engine('handlebars', handlebars.engine({ defaultLayout: 'main' }));
app.set('view engine', 'handlebars');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use('/css', express.static('public/css'));
app.use('/img', express.static('public/img'));


// rota para login do professor
app.get('/log-professor', function (req, res) {
    res.render('formLogin_Professor', { layout : 'mainLogin' });
});

//rota para login do aluno
app.get('/log-aluno', function (req, res) {
    res.render('formLogin_Aluno', { layout : 'mainLogin' });
});

//rota para tela de trilha
app.get('/tela-trilha', function (req, res) {
    res.render('trilha');
});

app.get('/trilha-modulos', function (req, res) {
    res.render('trilha_modulos');
});

// rota para tela-perfil
app.get('/tela-perfil', function (req, res) {
    if(req.session.user == null){
        res.redirect('/log-aluno')
    }else{
    res.render('telaPerfil', {user: req.session.user})}
});

app.get('/cad', function (req, res) {
    res.render('formCadastro', {layout : 'mainLogin'});
});

// procurando usuario e senha no banco criando 
app.post('/login', function (req, res) {

    User.findOne({
        where: {
            email: req.body.user,
            senha: req.body.senha
        }
    }).then(function (result) {
        if (result) {
            req.session.user = result
            console.log( req.session.user);
            req.session.user = result.toJSON();
            console.log(req.session.user);
            res.render('telaPerfil', {user: req.session.user})
        } else {
            res.render('/log-aluno')
        }

    });
});

app.post('/cadastro', function (req, res) {
    if(req.body.senha_cad && req.body.email_cad != null && req.body.senha_cad == req.body.confirmar_senha_cad){
    User.create({
        email: req.body.email_cad,
        senha: req.body.senha_cad
    })
        .then(function () {
            //redirecionando para home com o barra
            res.redirect('/log-aluno')
        }).
        catch(function (erro) {
            res.send('"Houve um erro: ' + erro);
        });
    }else{
        res.send("verifique se as senhas estao iguais")
    }
});

//rotas de questao
//buscando questao no banco
app.get('/questao', function (req, res) {
    Questao.findOne({
        where: {
            id_questao: 1
        }
    }).then(function (result) {
        result = result.toJSON();
        console.log(result);
        res.render('questao', {questao: result})
    }).catch((erro) => {
        res.send('Houve um erro: ' + erro);
    }); 
});

//questao 2
app.get('/questao2', function (req, res) {
    Questao.findOne({
        where: {
            id_questao: 2
        }
    }).then(function (result) {
        result = result.toJSON();
        console.log(result);
        res.render('questao2', {questao2: result})
    }).catch((erro) => {
        res.send('Houve um erro: ' + erro);
    }); 
});



//verificar alternativa certa obs:essa rota nao esta sendo usada no momento
app.get('/verificar/:id', function (req, res){
    Questao.findOne({
        where: {
            id_questao: req.params.id
        }
    }).then(function(questao){
        questao = questao.toJSON();
        if(questao.alternativa1 == questao.alternativa_correta ){
        console.log(questao.alternativa_correta)
    }

    });

})


app.listen(8081, function () {
    console.log("Servidor rodando");
});


