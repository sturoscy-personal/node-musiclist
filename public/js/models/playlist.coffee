depends = [
	'jquery',
	'underscore',
	'backbone'
]

define depends, ($, _, Backbone) ->
	PlayList = class extends Backbone.Model

		idAttribute: '_id'