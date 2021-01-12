class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit]
  before_action :move_to_index, only: [:edit]
  before_action :find_item, only: [:show,:edit,:update]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    
  end

  def edit
   
  end

  def update
    
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end

  def find_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :state_id, :burden_id, :prefecture_id, :ship_day_id, :name, :explanation, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
