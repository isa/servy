# node modules
path = require 'path'
sinon = require 'sinon'

ServerController = require path.join __dirname, '../../../controllers/server-controller'

describe 'ServerController', ->

   before () ->
      @req = Object.create
      @res = { end: sinon.spy() }

   it '"get" should return an empty list of servers when nothing is registered', () ->
      expected_servers = []

      server_model = { find: sinon.stub().returns expected_servers }
      app = { get: sinon.stub().returns server_model }

      sut = new ServerController app
      sut.get @req, @res

      @res.end.calledWith(JSON.stringify expected_servers).should.be.ok

   it '"get" should return a list of servers when at least one server is registered', () ->
      expected_servers = [
         name: 'dummy server'
      ]

      server_model = { find: sinon.stub().returns expected_servers }
      app = { get: sinon.stub().returns server_model }

      sut = new ServerController app
      sut.get @req, @res

      @res.end.calledWith(JSON.stringify expected_servers).should.be.ok
