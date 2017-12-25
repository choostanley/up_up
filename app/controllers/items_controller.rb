class ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		if session[:user_id] == nil
			flash[:error] = 'Sign in or Sign up to Auction'
			redirect_to items_path
		else
		@item = Item.new
		end
	end

	def create
		@item = Item.new(item_params)
		@item.user_id = session[:user_id]
		if @item.save
			redirect_to @item
		else
			render 'new'
		end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(item_params)
			redirect_to @item
		else
			render 'edit'
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_path
	end

	def add
		@item = Item.find(params[:'/comment'][:item_id])
		if session[:user_id].present? && params[:'/comment'][:counter].present?
		params[:'/comment'][:user_id]
		@item.counter << session[:user_id].to_s + ' ' + params[:'/comment'][:counter]
		@item.save
		else
		flash[:error] = 'Sign In and Counter offer'
		end
		redirect_to @item
	end

	private
	def item_params
		params.require(:item).permit(:name, :price, :image, :description)
	end
end
