class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
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
    params.require(:item).permit(:category_id, :state_id, :burden_id, :prefecture_id, :ship_day_id, :name, :explanation, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
