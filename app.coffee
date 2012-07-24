# Application requirements
express  = require 'express'
mongoose = require 'mongoose'

# Models
models   = require './models'

# Server
app = module.exports = express.createServer()

# Routes
site      = require './routes/site'
playlists = require './routes/playlists'
songs     = require './routes/songs' 

# Connect to mongodb
mongodb_url = process.env.MONGOHQ_URL || 'mongodb://localhost/desert'
mongoose.connect mongodb_url

# Configuration
app.configure ->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.set 'view options', { pretty: true }
  
  app.use express.logger()
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static __dirname + '/public'

app.configure 'development', ->
  app.use express.errorHandler { dumpExceptions: true, showStack: true }

app.configure 'production', ->
  app.use express.errorHandler()

# Index
app.get '/', site.index

# Playlists
app.get '/playlists', playlists.read

# Songs
app.get '/songs', songs.read

port = process.env.PORT || 3000
app.listen port, ->
  console.log "Listening on " + port 
