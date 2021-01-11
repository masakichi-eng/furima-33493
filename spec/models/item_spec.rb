require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '必要な情報を適切に入力すると、商品の出品ができること' do
      expect(@item).to be_valid
    end

    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end
    it '商品の状態についての情報が必須であること' do
      @item.state = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('State is not a number')
    end

    it '配送料の負担についての情報が必須であること' do
      @item.burden = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Burden is not a number')
    end

    it '発送元の地域についての情報が必須であること' do
      @item.state = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('State is not a number')
    end

    it '発送までの日数についての情報が必須であること' do
      @item.ship_day = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship day is not a number')
    end

    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
    end

    it '価格の範囲が、¥300以上であること' do
      @item.price = 111
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格の範囲が、¥9,999,999以下であること' do
      @item.price = 9_999_999_999
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '１２３４'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it '販売価格は英数混合では登録できないこと' do
      @item.price = '1a1a1a'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it '販売価格は全角文字では登録できないこと' do
      @item.price = 'ああああ'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it '販売価格は英字では登録できないこと' do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'カテゴリーの状態のプルダウン選択が--だと登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it '商品の状態のプルダウン選択が--だと登録できないこと' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("State must be other than 1")
    end

    it '配送料の負担のプルダウン選択が--だと登録できないこと' do
      @item.burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden must be other than 1")
    end

    it '発送元の地域のプルダウン選択が--だと登録できないこと' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it '発送までの日数の地域のプルダウン選択が--だと登録できないこと' do
      @item.ship_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship day must be other than 1")
    end



  end
end
