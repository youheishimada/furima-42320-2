class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_unless_authorized, only: [:edit, :update, :destroy]
  before_action :redirect_if_sold, only: [:edit]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_unless_authorized
    redirect_to root_path unless current_user == @item.user
  end

  def redirect_if_sold
   @item = Item.find(params[:id])
   redirect_to root_path if @item.sold_out?
  end

  def item_params
    params.require(:item).permit(
      :name, :description, :category_id, :status_id,
      :shipping_fee_id, :area_id, :shipping_day_id,
      :price, :image
    )
  end
end




