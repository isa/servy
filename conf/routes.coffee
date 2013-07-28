# Node Libraries
path = require 'path'

# Controllers
ServerController = require path.join __dirname, '../controllers/server-controller'

#Routes
module.exports =
   initRoutes: (app, publicDir) ->

      app.get '/',         (req, res) -> res.sendfile path.join(publicDir, 'index.html')
      app.get '/static/*', (req, res) -> res.sendfile path.join(publicDir, req.params[0])

      serverController = new ServerController app

      app.get     '/api/server/id/:id',                       serverController.get
