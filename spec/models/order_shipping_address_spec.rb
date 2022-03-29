require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_shipping_address).to be_valid
      end
      it 'buildingは空でも購入できること' do
        @order_shipping_address.building = ''
        expect(@order_shipping_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'tokenが空だと保存できないこと' do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと保存できないこと' do
        @order_shipping_address.postal_code = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_shipping_address.postal_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefectureを選択しないと保存できないこと' do
        @order_shipping_address.prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @order_shipping_address.city = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressesが空だと保存できないこと' do
        @order_shipping_address.addresses = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Addresses can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_shipping_address.phone_number = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以下だと保存できないこと' do
        @order_shipping_address.phone_number = '111111111'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end

      it 'phone_numberが12桁以上だと保存できないこと' do
        @order_shipping_address.phone_number = '111111111111'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it 'phone_numberに数字以外が含まれると保存できないこと' do
        @order_shipping_address.phone_number = 'aaaaaaaaaa'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
