depends = [
	'jquery',
	'underscore',
	'backbone',
	'cs!models/song'
]

define depends, ($, _, Backbone, Song) ->
	Songs = class extends Backbone.Collection

		# Reference the model
		model: Song

		# URL for RESTful interface
		url: '/songs/votes'
		
	new Songs