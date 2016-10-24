class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		user = User.create(user_params(:name, :email, :height, :happiness, :nausea, :tickets, :admin, :password))
		redirect_to user_path(user)
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
	end

	def update
	end

	private
		def user_params(*args)
			params.require(:user).permit(*args)
		end

end