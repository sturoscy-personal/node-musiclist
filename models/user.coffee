mongoose 		= require('mongoose')
mongooseAuth 	= require('mongoose-auth')
moment 			= require('moment')

Schema 		= mongoose.Schema
ObjectId 	= Schema.ObjectId;

User = new Schema
	isLoggedIn 		 : { type: Boolean, default: false }
	lastLogin 		 : Date
	lastLoginFormat  : String
	lastLogout 		 : Date
	lastLogoutFormat : String
	keepAlive 		 : Date

	User;

User.plugin mongooseAuth, {
	everymodule: {
		everyauth: {
			User: ->
				return User

			handleLogout: (req, res) ->
				errors = []

				if req.user
					req.user.isLoggedIn = false
					req.user.lastLogout = Date.now()

					now 			 = moment Date.now()
					formatLastLogout = now.format 'dddd, MMMM Do YYYY, h:mm:ss a'
					req.user.lastLogoutFormat = formatLastLogout

					req.user.save (err, user) ->
						errors.push err.message || err if err

				req.logout()
				res.writeHead 303, { 'Location': @logoutRedirectPath() }
				res.end()
		}
	}

	password: {
		loginWith: 'login'
		extraParams: {
			name: {
				first: String
				last: String
			}
			email: String
		}

		everyauth: {
			getLoginPath: '/login'
			postLoginPath: '/login'
			loginView: 'login.jade'
			getRegisterPath: '/register'
			postRegisterPath: '/register'
			registerView: 'register.jade'
			loginSuccessRedirect: '/'
			registerSuccessRedirect: '/'
			loginLocals: {
				title: 'Login'
			}
			registerLocals: {
				title: 'Register'
			}

			# Custom Authenticate Function to Update isLoggedIn
			authenticate: (login, password) ->
				promise
				errors = []

				errors.push 'Missing Login' if !login
				errors.push 'Missing Password' if !password
				return errors if errors.length

				promise = @Promise()
				@User()().authenticate login, password, (err, user) ->
					if err
						errors.push err.message || err
						return promise.fulfill errors
					if !user
						errors.push 'Failed Login'
						return promise.fulfill errors

					# Update isLoggedIn and lastLogin
					user.isLoggedIn = true
					user.lastLogin  = Date.now()

					now 			= moment Date.now()
					formatLastLogin = now.format 'dddd, MMMM Do YYYY, h:mm:ss a'
					user.lastLoginFormat = formatLastLogin

					# Save the Update
					user.save (err, user) ->
						promise.fulfill user

				return promise
		}
	}
}

module.exports = mongoose.model 'User', User