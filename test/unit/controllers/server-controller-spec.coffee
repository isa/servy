path = require 'path'
sinon = require 'sinon'

ServerController = require path.join __dirname, '../../../controllers/server-controller'

describe 'ServerController', ->

   before () ->
      @app = sinon.spy()

   it '"get" should return a list of servers registered to the system', () ->
      req = Object.create
      res =
         end: sinon.spy()

      sut = new ServerController @app
      sut.get req, res

      res.end.calledWith('hello world!').should.be.ok
