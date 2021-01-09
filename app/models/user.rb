class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

with_options presence: true do
  validates :nickname
  validates :sei_kanji, format: { with: /\A[ぁ-ん一-龥々]+\z/, message: '漢字を入力してください' }
  validates :mei_kanji, format: { with: /\A[ぁ-ん一-龥々]+\z/, message: '漢字を入力してください' }
  validates :sei_katakana, format: { with: /\A[ァ-ヶ]+\z/, message: 'カナを入力してください' }
  validates :mei_katakana, format: { with: /\A[ァ-ヶ]+\z/, message: 'カナを入力してください' }
  validates :birthday
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角で入力してください' }
end
end
