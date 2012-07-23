depends = [
	'jquery',
	'underscore',
	'backbone',
	'cs!collections/playlist',
	'cs!views/song'
]

define depends, ($, _, Backbone, PlayList, SongView) ->
	AppView = class extends Backbone.View

		# DOM item
		el: $ "#ultimate-list"

		# Initialize
		initialize: ->
			_.bindAll @, 'addSong', 'addAllSongs'
			
			PlayList.bind 'add', 	@addSong
			PlayList.bind 'reset',	@addAllSongs

			PlayList.fetch()

		addSong: (song) ->
			songView = new SongView { model: song }
			$(@el).append songView.render().el

		addAllSongs: ->
			PlayList.each @addSong