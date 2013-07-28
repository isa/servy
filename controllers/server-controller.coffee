class ServerController
   constructor: () ->

   get: (request, response) =>
      response.end 'hello world!'

module.exports = ServerController
