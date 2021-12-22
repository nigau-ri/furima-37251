require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    sleep(1)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe 'クレジットカード決済での購入機能' do
    context 'クレジットカード決済での購入ができる場合' do
      it '適切に入力すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名は空でも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context 'クレジットカード決済での購入ができない場合' do
      it '郵便番号が空だと購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号はハイフンなしでは購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号が登録できません。半角数字で入力してください。ハイフン(-)が必要です。")
      end
      it '郵便番号が全角では購入できない' do
        @order_address.postal_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号が登録できません。半角数字で入力してください。ハイフン(-)が必要です。")
      end
      it '郵便番号は数字以外が含まれていると購入できない' do
        @order_address.postal_code = '123-456a'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("郵便番号が登録できません。半角数字で入力してください。ハイフン(-)が必要です。")
      end
      it '都道府県が空では購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください。")
      end
      it '都道府県に「---」が選択されている場合は購入できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("都道府県を入力してください。")
      end
      it '市区町村が空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空では購入できない' do
        @order_address.addresses = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号にハイフンが含まれていると購入できない' do
        @order_address.phone_number = '090-1234-1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号が登録できません。半角数字で入力してください。ハイフン(-)を入力しないでください。")
      end
      it '電話番号が全角では購入できない' do
        @order_address.phone_number = '０９０１２３４１２３４'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号が登録できません。半角数字で入力してください。ハイフン(-)を入力しないでください。")
      end
      it '電話番号は数字以外が含まれていると購入できない' do
        @order_address.phone_number = '0901234abcd'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号が登録できません。半角数字で入力してください。ハイフン(-)を入力しないでください。")
      end
      it '電話番号が9桁以下では購入できない' do
        @order_address.phone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号が登録できません。半角数字で入力してください。ハイフン(-)を入力しないでください。")
      end
      it '電話番号が12桁以上では購入できない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("電話番号が登録できません。半角数字で入力してください。ハイフン(-)を入力しないでください。")
      end
      it 'userが空では購入できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが空では購入できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Itemを入力してください")
      end
      it 'tokenが空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("正しいカード情報を入力してください")
      end
    end
  end
end
