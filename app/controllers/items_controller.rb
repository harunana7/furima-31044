class ItemsController < ApplicationController
	before_action :authenticate_user!, only: [:new]


	def index
		# @items = Item.all
		# @items = Item.order("created_at DESC")
	end

	def new
    @item = Item.new
	end
	
	def create
    Item.create(item_params)
  end
	
  private
  def Item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

end
