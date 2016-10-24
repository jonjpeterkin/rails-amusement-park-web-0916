class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(username: session_params(:username))
		session[:user_id] = user.id 
		redirect_to user_path(user)
	end

	def destroy
		session[:user_id] = nil
		redirect_to homepage_path
	end

	private

		def session_params(*args)
			params.require(*args)
		end


end