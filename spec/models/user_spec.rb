require 'rails_helper'

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname,email,password,password_confirmation,sei_kanji,mei_kanji,sei_katakana,mei_katakana,birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに＠マークがなければ登録できないこと' do
      @user.email = 'taro.jp'
      @user.valid?
      
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが全角では登録できないこと' do
      @user.password = 'b１b１b１'
      @user.password_confirmation = 'b１b１b１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数混合で入力してください")
    end

    it 'passwordが英字だけでは登録できないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数混合で入力してください")
    end

    it 'passwordが数字だけでは登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数混合で入力してください")
    end

    it 'sei_kanjiが空では登録できないこと' do
      @user.sei_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Sei kanji can't be blank", 'Sei kanji 漢字を入力してください')
    end

    it 'mei_kanjiが空では登録できないこと' do
      @user.mei_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Mei kanji can't be blank", 'Mei kanji 漢字を入力してください')
    end

    it 'sei_katakanaが空では登録できないこと' do
      @user.sei_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Sei katakana can't be blank", 'Sei katakana カナを入力してください')
    end

    it 'mei_katakanaが空では登録できないこと' do
      @user.mei_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Mei katakana can't be blank", 'Mei katakana カナを入力してください')
    end

    it 'sei_kanjiがカタカナだと登録できないこと' do
      @user.sei_kanji = 'ヤマダ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Sei kanji 漢字を入力してください')
    end

    it 'mei_kanjiがカタカナだと登録できないこと' do
      @user.mei_kanji = 'タロウ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Mei kanji 漢字を入力してください')
    end

    it 'sei_katakanaが漢字だと登録できないこと' do
      @user.sei_katakana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('Sei katakana カナを入力してください')
    end

    it 'mei_katakanaが漢字だと登録できないこと' do
      @user.mei_katakana = '太朗'
      @user.valid?
      expect(@user.errors.full_messages).to include('Mei katakana カナを入力してください')
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '1a2b3c'
      @user.password_confirmation = '1a2b3c'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '1a2b3'
      @user.password_confirmation = '1a2b3'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '1a2b3c'
      @user.password_confirmation = '1a2b3c4'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  end

end