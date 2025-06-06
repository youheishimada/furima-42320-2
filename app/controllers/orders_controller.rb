class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_invalid_access

  def index
    @order_address = OrderAddress.new
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"] # ← これを追加

  end

  def create
  @order_address = OrderAddress.new(order_params)
  if @order_address.valid?
    pay_item  # ← ここで支払い
    @order_address.save
    redirect_to root_path
  else
     gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    render :index
  end
  end

  private

  def order_params
  params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number)
        .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
end
  def set_item
    @item = Item.find(params[:item_id])
  end

   def redirect_if_invalid_access
    redirect_to root_path if current_user == @item.user || @item.order.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
