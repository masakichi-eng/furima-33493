class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ァ-ヶぁ-ん一-龥々]+\z/, message: '漢字を入力してください' } do
      validates :sei_kanji
      validates :mei_kanji
    end
    with_options format: { with: /\A[ァ-ヶ]+\z/, message: 'カナを入力してください' } do
      validates :sei_katakana
      validates :mei_katakana
    end
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数混合で入力してください' }
  end

  has_many :items
  has_many :purchases
  has_many :comments
  has_many :likes
end
