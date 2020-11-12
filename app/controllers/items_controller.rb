class ItemsController < ApplicationController
	before_action :authenticate_user!, only: [:new]


	def index
		@items = Item.all
		# @items = Item.order("created_at DESC")
	end

	def new
    @item = Item.new
	end

	def create
		 @item = Item.new(item_params)
		if @item.save
       redirect_to root_path
    else
		 render :new
    end
  end
	

	
  private
  def item_params
    params.require(:item).permit(:name, :content, :image, :explanation, :category_id, :condition_id, :delivery_fee_id, :ship_from_location_id, :delivery_period_id, :price).merge(user_id: current_user.id)
  end

end
