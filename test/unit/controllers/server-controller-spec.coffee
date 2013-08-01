# node modules
path = require 'path'
sinon = require 'sinon'

ServerController = require path.join __dirname, '../../../controllers/server-controller'

describe 'ServerController', ->

   # before () ->

   it '"get" should return an empty list of servers when nothing is registered', () ->
      expected_servers = []

      app =
         get: sinon.stub().returns
            find: sinon.stub().returns expected_servers

      req = Object.create
      res =
         end: sinon.spy()

      sut = new ServerController app
      sut.get req, res

      res.end.calledWith(JSON.stringify expected_servers).should.be.ok

   it '"get" should return a list of servers when at least one server is registered', () ->
      expected_servers = [
         name: 'dummy server'
      ]

      app =
         get: sinon.stub().returns
            find: sinon.stub().returns expected_servers

      req = Object.create
      res =
         end: sinon.spy()

      sut = new ServerController app
      sut.get req, res

      sinon.assert.calledWith res.end, sinon.match JSON.stringify expected_servers
