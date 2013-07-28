class ServerController
   constructor: (@rest) ->

   get: (request, response) =>
      response.end 'hello world!'

module.exports = ServerController
