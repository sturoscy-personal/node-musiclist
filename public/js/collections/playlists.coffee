depends = [
	'jquery',
	'underscore',
	'backbone',
	'cs!models/playlist'
]

define depends, ($, _, Backbone, Song) ->
	PlayList = class extends Backbone.Collection

		# Reference the model
		model:PlayList

		# URL for RESTful interface
		url: '/playlist/votes'
		
	new PlayList