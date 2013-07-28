class ServerController
   constructor: (@app) ->

   get: (request, response) =>
      response.end 'hello world!'

module.exports = ServerController
