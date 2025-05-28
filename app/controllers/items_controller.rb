class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :redirect_unless_authorized, only: [:edit, :update]

  def index
   @items = Item.all.order(created_at: :desc)
  end

  def show
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

  #def destroy
   #@item = Item.find(params[:id])
   #@item.destroy
   #redirect_to root_path
  #end

  private

  def set_item
    @item = Item.find(params[:id])
  end
  
  def redirect_unless_authorized
    redirect_to root_path unless current_user == @item.user
  end
  
  def item_params
    params.require(:item).permit(
      :name, :description, :category_id, :status_id,
      :shipping_fee_id, :area_id, :shipping_day_id,
      :price, :image
    )
  end
end
