require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '商品購入記録の保存' do
    before do
      @purchase = FactoryBot.build(:purchase)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase).to be_valid
    end

    it 'tokenが空では登録できないこと' do
      @purchase.token = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空だと保存できないこと' do
      @purchase.zip = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Zip can't be blank")
    end

    it '郵便番号は半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase.zip = '１２３４５６７'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Zip Input correctly')
    end

    it '都道府県が空だと保存できないこと' do
      @purchase.prefecture_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '都道府県を選択しないと保存できないこと' do
      @purchase.prefecture_id = 1
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Prefecture Select')
    end

    it '市区町村が空だと保存できないこと' do
      @purchase.city = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空だと保存できないこと' do
      @purchase.address = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Address can't be blank")
    end

    it '建物名は空でも保存できること' do
      @purchase.building = nil
      expect(@purchase).to be_valid
    end

    it '電話番号が空だと保存できないこと' do
      @purchase.phone_no = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone no can't be blank")
    end

    it '電話番号は半角数字以外だと保存できないこと' do
      @purchase.phone_no = '１２３４５６７８'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone no Input only number')
    end

    it '電話番号は12桁以上だと保存できないこと' do
      @purchase.phone_no = '123456789012'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone no is too long (maximum is 11 characters)')
    end
  end
end
