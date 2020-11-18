class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_top, only: [:index]
  before_action :authenticate_user!, only: [:index]

  def index
      @order = OrderAddress.new
  end

  # def index
  #     redirect_to root_path if @order = OrderAddress.new
  # end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :telephone).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_top
    redirect_to root_path if @item.order.present? || current_user.id == @item.user_id
    end

end
