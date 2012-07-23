depends = [
	'jquery',
	'underscore',
	'backbone',
	'cs!models/song'
]

define depends, ($, _, Backbone, Song) ->
	PlayList = class extends Backbone.Collection

		# Reference the model
		model: Song

		# URL for RESTful interface
		url: '/songs'
		
	new PlayList