class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :comments
  has_many :likes
  belongs_to :user
  has_one :purchase

  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :ship_day

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price
    validates :image
  end
  
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :burden_id
    validates :ship_day_id
  end
  validates :prefecture_id, numericality: { other_than: 0 }

  has_one_attached :image

  

end
