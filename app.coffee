# Node Libraries
express = require 'express'
http = require 'http'
config = require 'yaml-config'
path = require 'path'
winston = require 'winston'
expressWinston = require 'express-winston'

# Configuration
settings = config.readConfig require.resolve('./conf/config.yaml')
publicDir = path.join __dirname, 'public'

# ======= Create & Run Web Server =======

app = express()

# ------- configure web server modules -------
winston.add winston.transports.File,
   filename: "#{settings.app.logDir}/app.log"
#winston.remove winston.transports.Console

app.configure () ->
   app.use express.bodyParser()
   app.use express.cookieParser()
   app.use expressWinston.logger({ transports: [ new winston.transports.File(json: true, filename: "#{settings.app.logDir}/access.log") ] })
   app.use app.router
   app.use express.static(publicDir, { maxAge: settings.misc.oneDay })

app.configure 'development', () ->
   app.use express.errorHandler({ dumpExceptions: true, showStack: true })

# ------- init routes -------
apiRoutes = require path.join(__dirname, 'conf', 'routes')
apiRoutes.initRoutes(app, publicDir)

# ------- run web server -------
server = http.createServer(app)
server.listen settings.app.port, () ->
   winston.info "Listening on port %s...", settings.app.port;
