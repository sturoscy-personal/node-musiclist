PlayList = require('mongoose').model('PlayList')

exports.create = (req, res) ->
  playlist = new PlayList req.body
  playlist.save (err) ->
    if err
      res.send err
    res.send playlist

exports.read = (req, res) ->
  PlayList.find {}, (err, playlists) ->
    if err
      res.send err
    res.send playlists

exports.update = (req, res) ->
  # Remove _id from put so mongodb doesn't complain
  delete req.body._id
  PlayList.update {_id: req.params._id}, req.body, (err) ->
    res.send err

exports.delete =  (req, res) ->
  PlayList.remove {_id: req.params._id}, (err) ->
    res.send err

# More custom type queries
exports.findById = (req, res) ->
  PlayList.findById req.params.id, (err, playlist) ->
    if err
      console.log err
    res.send playlist