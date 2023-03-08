require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる時' do
      it '商品出品ができる' do
        expect(@item).to be_valid
      end
    end

    context '消費出品できないとき' do
      it 'item_nameが空の時、出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item name can't be blank")
      end
      it 'item_textが空の時、出品できない' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item text can't be blank")
      end
      it 'category_idが1の時、出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it 'condition_idが1の時、出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end
      it 'area_idが1の時、出品できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Area can't be blank")
      end
      it 'postage_idが1の時、出品できない' do
        @item.postage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Postage can't be blank")
      end
      it 'sendday_idが1の時、出品できない' do
        @item.sendday_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Sendday can't be blank")
      end
      it 'priceが300未満の時、出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
      end
      it 'priceが9999999以上の時、出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceは数字以外は入力できない' do
        @item.price = 'abcde'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
