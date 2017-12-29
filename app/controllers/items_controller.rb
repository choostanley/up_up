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

	def search
		@items = Item.search_by_name(params[:'/find'][:name])
		render template: "items/index"
	end

	def users

		@live = Live.new(user_id: params[:user_id], item_id: params[:item_id])
		@live.save
		Live.all.each {|x| x. delete if ((Time.now - x.created_at) > 5)}
		@live_user = Live.where(item_id: params[:item_id]).count

		@user_id_array =[]
		@user_array = []	
		@bid_array = []
		@item = Item.find(params[:item_id])
		@item.counter.each {|x| 
			@user_id_array << x[0]
			@user_array << User.find(x[0]).name
			@bid_array << x[2..-1]
		}
		render plain: {save: @item, live: @live_user, user: @user_array, bid: @bid_array, id: @user_id_array}.to_json
		# render plain: {save: true}.to_json
	end

	private
	def item_params
		params.require(:item).permit(:name, :price, :image, :description)
	end
end
