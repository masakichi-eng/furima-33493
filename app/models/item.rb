class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
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
  #  validates :price, format: { with: /[3][0][0]|[1-9][0-9][0-9][0-9][0-9][0-9][0-9]/,  message: '300~9,999,999までの半角数字を入力してください' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, numericality: { other_than: 1 }
  validates :state_id, numericality: { other_than: 1 }
  validates :burden_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :ship_day_id, numericality: { other_than: 1 }

  has_one_attached :image
end
