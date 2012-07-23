title = 'Desert Island Discs'

exports.index = (req, res) ->
  res.render 'index', { title: title }