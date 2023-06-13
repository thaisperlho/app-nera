const Sequelize = require('sequelize');
require('dotenv').config();

// Conexão com o banco de dados
const sequelize = new Sequelize(process.env.DB_NAME,process.env.DB_USER,process.env.DB_PASSWORD,{
    host:process.env.DB_HOST,
    port: "5432",
    dialect: 'postgres'
});

module.exports = {
    Sequelize: Sequelize ,
    sequelize: sequelize
}