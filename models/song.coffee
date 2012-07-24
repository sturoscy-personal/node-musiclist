mongoose = require 'mongoose'
Schema   = mongoose.Schema
ObjectId = Schema.ObjectId

Song = new Schema
	userID:		String
	rank: 		Number
	title: 		String
	artist: 	String
	album: 		String
	year: 		String
	genre:		String
	votes:		Number

module.exports = mongoose.model 'Song', Song