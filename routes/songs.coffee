Song = require('mongoose').model('Song')

exports.create = (req, res) ->
  song = new Song req.body
  song.save (err) ->
    if err
      res.send err
    res.send song

exports.read = (req, res) ->
  Song.find {}, (err, songs) ->
    if err
      res.send err
    res.send songs

exports.update = (req, res) ->
  # Remove _id from put so mongodb doesn't complain
  delete req.body._id
  Song.update {_id: req.params._id}, req.body, (err) ->
    res.send err

exports.delete =  (req, res) ->
  Song.remove {_id: req.params._id}, (err) ->
    res.send err

# More custom type queries
exports.findById = (req, res) ->
  Song.findById req.params.id, (err, song) ->
    if err
      res.send err
    res.send song

exports.findByVotes = (req, res) ->
  query = Song.find {}
  query.asc('upvotes')
  query.limit(10)

  query.exec (err, songs) ->
    res.send songs
    console.log songs