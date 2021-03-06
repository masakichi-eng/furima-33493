class ItemsController < ApplicationController



  before_action :authenticate_user!, only: [:new,:edit]
  before_action :find_item, only: [:show,:edit,:update,:destroy]
  before_action :move_to_index, only: [:edit,:destroy]
 
  def index
    @items = Item.order("created_at DESC")

  end

  def new
    @item = Item.new
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @like = Like.find_by(user_id: current_user.id, item_id: @item.id)
    @likes_count = Like.where(item_id: @item.id).count
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



  def destroy
      @item.destroy
      redirect_to root_path
  end


  def find_item
    @item = Item.find(params[:id])
  end

  def search
    @items = SearchItemsService.search(params[:keyword])
  end

  private

  def move_to_index
    if current_user.id != @item.user.id || @item.purchase != nil 
      redirect_to action: :index
    end
  end


  def item_params
    params.require(:item).permit(:category_id, :state_id, :burden_id, :prefecture_id, :ship_day_id, :name, :explanation, :price,
                                 :image).merge(user_id: current_user.id)
  end
end

