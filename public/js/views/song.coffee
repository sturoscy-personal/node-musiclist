depends = [
	'jquery',
	'underscore',
	'backbone',
	'text!templates/song.html'
]

define depends, ($, _, Backbone, SongTemplate) ->
	SongView = class extends Backbone.View

		tagName: 'tr'

		# Template for individual song
		SongTemplate: _.template SongTemplate

		initialize: ->
			_.bindAll @, 'render'
			@model.bind 'change', @render
			@model.view = @

		render: ->
			$(@el).html @SongTemplate @model.toJSON()
			@setContent()
			@

		setContent: ->
			rank      = @model.get 'rank'
			title     = @model.get 'title'
			artist    = @model.get 'artist'
			album     = @model.get 'album'
			console.log rank