require 'sequelize'

Server = sequelize.define 'Server',
   id:
      type: Sequelize.INTEGER
      autoIncrement: true
      allowNull: false
      primaryKey: true
   name:
      type: Sequelize.STRING
      allowNull: false
   description: Sequelize.TEXT
   states:
      type: Sequelize.ENUM,
      values: ['available', 'assigned']
      defaultValue: 'available'
   registrationDate:
      type: Sequelize.DATE
      allowNull: false
      defaultValue: Sequelize.NOW

module.exports = Server
