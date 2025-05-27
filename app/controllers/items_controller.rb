class ItemsController < ApplicationController
   before_action :authenticate_user!, only: [:new, :create]
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

  #def edit
  #end
  
  #def update
  #end

  #def destroy
   #@item = Item.find(params[:id])
   #@item.destroy
   #redirect_to root_path
  #end

  private

  def item_params
    params.require(:item).permit(
      :name, :description, :category_id, :status_id,
      :shipping_fee_id, :area_id, :shipping_day_id,
      :price, :image
    )
  end
end
