class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

			redirect_to root_path
  def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to root_path
    else
        render :new
    end
  end
		
  def show
    @item = Item.find(params[:id])
  end
	
  private
  def item_params
    params.require(:item).permit(:name, :content, :image, :explanation, :category_id, :condition_id, :delivery_fee_id, :ship_from_location_id, :delivery_period_id, :price).merge(user_id: current_user.id)
  end

end
