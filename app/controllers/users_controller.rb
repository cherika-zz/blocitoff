class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:show]

	def update
		if current_user.update_attributes(user_params)
			flash[:notice] = "User information updated"
			redirect_to edit_user_registration_path
		else
			flash[:error] = "Invalid user information"
			redirect_to edit_user_registration_path
		end
	end

	def show
		# if you use instance variables in the view, they have to be set in the controller.
		@items = current_user.items 
	end

	def index
		if current_user && current_user.email == 'hakobyan.sn@gmail.com'
			@users = User.all
		else
			redirect_to :root
		end
	end

	private

	def user_params
		params.require(:user).permit(:name)
	end
end
