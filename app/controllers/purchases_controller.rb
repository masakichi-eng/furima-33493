class PurchasesController < ApplicationController

  before_action :authenticate_user!, only: [:index,:create]
  before_action :find_item, only: [:index,:create]
  before_action :move_to_index

  def index
    @purchase_shipping = PurchaseShipping.new
    
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
    pay_item
     @purchase_shipping.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:postal, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id,item_id: params[:item_id])
  end


  def find_item
    @item = Item.find(params[:item_id])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    
    if @item.purchase != nil || current_user.id == @item.user.id
      redirect_to root_path
    end
  end

end
