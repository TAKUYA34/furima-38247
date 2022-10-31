require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context '商品が出品できる' do
      it '必要な情報が全て存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない時' do
      it '商品画像がなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.explanation = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが初期値では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'situation_idが空では登録できない' do
        @item.situation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it 'situation_idが初期値では登録できない' do
        @item.situation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it 'delivery_charge_idが初期値では登録できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it 'sender_idが空では登録できない' do
        @item.sender_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender can't be blank")
      end
      it 'sender_idが初期値では登録できない' do
        @item.sender_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender can't be blank")
      end
      it 'shipping_idが空では登録できない' do
        @item.shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it 'shipping_idが初期値では登録できない' do
        @item.shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円以下だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9_999_999円以上だと登録できない' do
        @item.price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end
      it 'priceは半角数値以外では登録できない' do
        @item.price = '12a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end