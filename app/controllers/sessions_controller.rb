class SessionsController < ApplicationController
	def new
		if session[:user_id] != nil
			flash[:error] = 'Please Sign Out before Signing IN'
			redirect_to items_path
		end
	end

	def create
		@user = User.find_by(name: session_params[:name])
		if @user.authenticate(session_params[:password])
			session[:user_id] = @user.id
			redirect_to items_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to items_path
	end

	private
	def session_params
		params.require(:'/sessions').permit(:name, :email, :password)
	end
end
