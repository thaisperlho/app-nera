const db = require('./db');

// criando a tabela postangens

const Usuario = db.sequelize.define('usuario', {
    id_usuario: { type: db.Sequelize.INTEGER, 
    autoIncrement: true, 
    allowNull: false, 
    primaryKey: true },    
    email: {
        type: db.Sequelize.STRING
    },
    senha: {
        type: db.Sequelize.STRING
    },
    id_tipo_usuario: { type: db.Sequelize.INTEGER, 
        foringKey: true }
}, { freezeTableName: true });


// Post.sync({force: true});

module.exports = Usuario;