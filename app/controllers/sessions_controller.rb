class SessionsController < ApplicationController
	skip_before_action :require_admin
	skip_before_action :require_login


	def new
	end

	def create
		user = User.find_by(name: session_params(:name))
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