require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
    describe '購入情報の保存' do
      before do
        @user = FactoryBot.create(:user)
        @item = FactoryBot.create(:item)
        @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: @user.id, item_id: @item.id)
        sleep(1)
      end
      context "購入情報が保存できる場合" do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_shipping).to be_valid
      end

      it '建物名が空でも保存できること' do
        @purchase_shipping.building = nil
        expect(@purchase_shipping).to be_valid
      end
     end
  


     context "購入情報が保存できない場合" do
      it 'user_idが空だと保存できないこと' do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できないこと' do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空だと保存できないこと' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと保存できないこと' do
        @purchase_shipping.postal = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal can't be blank", "Postal is invalid. Include hyphen(-)")
      end

      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_shipping.postal = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
      end
      it '都道府県を選択していないと保存できないこと' do
        @purchase_shipping.prefecture_id = 0
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県が空だと保存できないこと' do
        @purchase_shipping.prefecture_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市町村が空だと保存できないこと' do
        @purchase_shipping.city = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @purchase_shipping.address = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end
      
      it '電話番号が9桁もしくは10桁の数字でないと保存できないこと' do
        @purchase_shipping.phone_number = 1111
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid.")
      end
      it '電話番号が数字でないと保存できないこと' do
        @purchase_shipping.phone_number = 'あああ'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid.")
      end
      it '電話番号が空だと保存できないこと' do
        @purchase_shipping.phone_number = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid.")
      end
    end
    end
  end
