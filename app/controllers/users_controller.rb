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
		flash[:error] = []
		flash[:error] << 'Name is empty' if user_params[:name].empty?
		flash[:error] << 'Absent or Invalid Email' if  (/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.match(user_params[:email]) == nil)
		flash[:error] << 'Password is empty' if user_params[:password].empty?
		if (/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.match(user_params[:email]) != nil) 
			if @user.save
				session[:user_id] = @user.id
				redirect_to items_path
			else
				render 'edit'
			end
		else 
			redirect_to new_user_path
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
		params.require(:user).permit(:name, :email, :password)
	end
end
