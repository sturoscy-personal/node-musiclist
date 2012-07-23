depends = [
	'jquery',
	'underscore',
	'backbone'
]

define depends, ($, _, Backbone) ->
	Song = class extends Backbone.Model

		idAttribute: '_id'

		defaults: {
			rank: 	'1.'
			title:  'A Day in the Life'
			artist: 'The Beatles'
			album:  'Sgt. Peppers'
			year:   '1971'
			genre:  'Rock'
		}