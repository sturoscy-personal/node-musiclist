mongoose = require 'mongoose'
Schema   = mongoose.Schema
ObjectId = Schema.ObjectId

Song     = new Schema
	userID:		String
	rank: 		Number
	title: 		String
	artist: 	String
	album: 		String
	year: 		String
	genre:		String
	upvotes:	Number
	downvotes:	Number

Comment  = new Schema
	userID:			String
	body:			String
	date_created:	{ type: Date, default: Date.now() }
	

PlayList = new Schema
	userID: 	 	String
	title:		 	String
	genre:		 	String
	upvotes:	 	Number
	downvotes:		Number
	songs:  	 	[Song]
	comments:		[Comment]
	date_created: 	{ type: Date, default: Date.now() }
	date_modified:	Date

module.exports = mongoose.model 'PlayList', PlayList