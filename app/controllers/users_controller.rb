class UsersController < ApplicationController
	# def index
	# 	@items = Item.all
	# end

	def show
		@user = User.find(session[:user_id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to items_path
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(session[:user_id])
	end

	def update
		@user = User.find(session[:user_id])
		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(session[:user_id])
		@user.destroy
		session[:user_id] = nil
		redirect_to items_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :password)
	end
end
