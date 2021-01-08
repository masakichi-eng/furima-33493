class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :sei_kanji, presence: true, format: { with: /\A[ぁ-ん一-龥々]+\z/,message:'漢字を入力してください' }
         validates :mei_kanji, presence: true, format: { with: /\A[ぁ-ん一-龥々]+\z/,message:'漢字を入力してください' }
         validates :sei_katakana, presence: true, format: { with: /\A[ァ-ヶ]+\z/,message:'カナを入力してください' }
         validates :mei_katakana, presence: true, format: { with: /\A[ァ-ヶ]+\z/,message:'カナを入力してください' }
         validates :birthday,presence: true
end