class ServerController
   constructor: (app) ->
      @Server = app.get 'Server'

   get: (request, response) ->
      servers = @Server.find()
      response.end JSON.stringify servers

module.exports = ServerController
