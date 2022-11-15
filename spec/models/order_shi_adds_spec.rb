require 'rails_helper'

RSpec.describe OrderShiAdds, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.1
      @order_shiadds = FactoryBot.build(:order_shi_adds, user_id: user.id, item_id: item.id)
    end
 

    context '商品が購入できる' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shiadds).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_shiadds.building = ''
        expect(@order_shiadds).to be_valid
      end
    end

    context '商品が購入できない' do
      it 'post_codeが空だと保存できないこと' do
        @order_shiadds.post_code = ''
        @order_shiadds.valid?
        expect(@order_shiadds.errors.full_messages).to include("Post code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shiadds.post_code = '1234567'
        @order_shiadds.valid?
        expect(@order_shiadds.errors.full_messages).to include("Post code Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'sender_idが空だと保存できない' do
        @order_shiadds.sender_id = ''
        @order_shiadds.valid?
        expect(@order_shiadds.errors.full_messages).to include("Sender can't be blank")
      end
      it 'sender_idが初期値では登録できない' do
        @order_shiadds.sender_id = '1'
        @order_shiadds.valid?
        expect(@order_shiadds.errors.full_messages).to include("Sender can't be blank")
      end
      it '電話番号が半角数値以外だと登録できない' do
        @order_shiadds.phone = '090-1234-5678'
        @order_shiadds.valid?
        expect(@order_shiadds.errors.full_messages).to include("Phone is invalid. Input half size number characters.")
      end
      it '電話番号が9桁以下では登録できない' do
        @order_shiadds.phone = '00033232'
        @order_shiadds.valid?
        expect(@order_shiadds.errors.full_messages).to include("Phone is invalid. Input half size number characters.")
      end
      it '電話番号が12桁以上では登録できない' do
        @order_shiadds.phone = '0003323206543'
        @order_shiadds.valid?
        expect(@order_shiadds.errors.full_messages).to include("Phone is invalid. Input half size number characters.")
      end
      it '電話番号が空だと保存できない' do
        @order_shiadds.phone = ''
        @order_shiadds.valid?
        expect(@order_shiadds.errors.full_messages).to include("Phone can't be blank")
      end
      it 'localityが空だと登録できない' do
        @order_shiadds.locality = ''
        @order_shiadds.valid?
        expect(@order_shiadds.errors.full_messages).to include("Locality can't be blank")
      end
      it 'addressが空だと登録できない' do
        @order_shiadds.address = ''
        @order_shiadds.valid?
        expect(@order_shiadds.errors.full_messages).to include("Address can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_shiadds.user_id = nil
        @order_shiadds.valid?
        expect(@order_shiadds.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_shiadds.item_id = nil
        @order_shiadds.valid?
        expect(@order_shiadds.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_shiadds.token = nil
        @order_shiadds.valid?
        expect(@order_shiadds.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
