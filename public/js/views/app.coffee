depends = [
	'jquery',
	'underscore',
	'backbone',
	'cs!collections/songs',
	'cs!views/song'
]

define depends, ($, _, Backbone, Songs, SongView) ->
	AppView = class extends Backbone.View

		# DOM item
		el: $ "#ultimate-list"

		# Initialize
		initialize: ->
			_.bindAll @, 'addSong', 'addAllSongs'
			
			Songs.bind 'add', 	@addSong
			Songs.bind 'reset',	@addAllSongs

			Songs.fetch()

		addSong: (song) ->
			songView = new SongView { model: song }
			$(@el).append songView.render().el

		addAllSongs: ->
			Songs.each @addSong