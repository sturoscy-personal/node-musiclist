Song = require('mongoose').model('Song')

exports.create = (req, res) ->
  song = new Song req.body
  song.save (err) ->
    if err
      res.send err
    res.send song

exports.read = (req, res) ->
  Song.find {}, (err, docs) ->
    if err
      res.send err
    res.send docs

exports.update = (req, res) ->
  # Remove _id from put so mongodb doesn't complain
  delete req.body._id
  Song.update {_id: req.params._id}, req.body, (err) ->
    res.send err

exports.delete =  (req, res) ->
  Song.remove {_id: req.params._id}, (err) ->
    res.send err