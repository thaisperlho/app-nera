const db = require('./db');

// criando a tabela postangens

const Questao = db.sequelize.define('questao', {
    id_questao: { type: db.Sequelize.INTEGER, 
    allowNull: false, 
    primaryKey: true },    
    enunciado: {
        type: db.Sequelize.STRING
    }, 
    alternativa1:{
        type: db.Sequelize.STRING
    },
    alternativa2:{
        type: db.Sequelize.STRING
    },
    alternativa3:{
        type: db.Sequelize.STRING
    },
    alternativa4:{
        type: db.Sequelize.STRING
    },
    alternativa_correta:{
        type: db.Sequelize.STRING
    },
}, { freezeTableName: true });


// Post.sync({force: true});

module.exports = Questao;