class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal, :prefecture_id, :city, :address, :building, :phone_number, :price, :token


  with_options presence: true do
    validates :token
    validates :postal, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number,format: { with: /\A(0{1}\d{9,10})\z/, message: "is invalid." }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(purchase_id: purchase.id, postal: postal, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number)
  end

end