mongoose = require 'mongoose'
Schema   = mongoose.Schema
ObjectId = Schema.ObjectId;

# Song Schema/Model
Song 	 = require './song'

PlayList = new Schema
	author: 	 	String
	title:		 	String
	genre:		 	String
	votes: 		 	Number
	songs:  	 	[Song]
	date_create: 	{ type: Date, default: Date.now() }
	date_modified:	Date

module.exports = mongoose.model 'PlayList', PlayList