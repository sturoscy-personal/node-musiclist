depends = [
	'jquery',
	'underscore',
	'backbone',
	'text!templates/playlist.html'
]

define depends, ($, _, Backbone, PlayListTemplate) ->
	PlayListView = class extends Backbone.View

		tagName: 	'div'
		className:	'newest-playlist'

		# Template for individual song
		PlayListTemplate: _.template PlayListTemplate

		initialize: ->
			_.bindAll @, 'render'
			@model.bind 'change', @render
			@model.view = @

		render: ->
			$(@el).html @PlayListTemplate @model.toJSON()
			@setContent()
			@

		setContent: ->
			console.log "Fired"