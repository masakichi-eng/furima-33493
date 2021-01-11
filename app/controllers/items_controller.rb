class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :move_to_index, only: [:destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end



  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  def destroy
    item = Item.find(params[:id])
   item.destroy
      redirect_to root_path
  end
  private

  def move_to_index
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user.id
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:category_id, :state_id, :burden_id, :prefecture_id, :ship_day_id, :name, :explanation, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
