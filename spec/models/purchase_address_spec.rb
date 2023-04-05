require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, item_id: item, user_id: user)
  end

  describe '商品購入機能' do
    context '商品購入ができるとき' do
      it '商品購入ができる' do
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it '郵便番号が空の場合、購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号にハイフンが入っていない場合、購入できない' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '都道府県が未選択の場合、購入できない' do
        @purchase_address.area_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Area can't be blank")
      end

      it '住所が空の場合、購入できない' do
        @purchase_address.address_street = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address street can't be blank")
      end

      it '番地が空の場合、購入できない' do
        @purchase_address.address_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address number can't be blank")
      end
      
      it '電話番号が空の場合、購入できない' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が10~11桁でない場合、購入できない' do
        @purchase_address.phone_number = '12345'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が数字以外の場合、購入できない' do
        @purchase_address.phone_number = 'アイウエオ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenが空の場合、購入できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
