require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
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
        expect(@purchase_address.errors.full_message).to include("City id can't be blank")
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
        @purchase_address.phone_number = '12345678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("")
      end
    end
  end
end
