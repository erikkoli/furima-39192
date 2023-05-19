require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @exhibit = FactoryBot.create(:exhibit)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, exhibit_id: @exhibit.id)
  end

  describe '商品購入' do
    context '購入できる場合' do
      it 'すべての値が存在すれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'post_codeが空では購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeがハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeが半角でないと保存できない' do
        @purchase_address.post_code = '１２３－４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid")
      end
      it 'prefecture_idが初期値では購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では購入できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上ではないと購入できない' do
        @purchase_address.phone_number = '098765432'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it 'phone_numberが12桁以上では購入できない' do
        @purchase_address.phone_number = '098765432198'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'phone_numberが全角では購入できない' do
        @purchase_address.phone_number = '０９８７６５４３２１０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが紐づいていないと購入できない' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'exhibit_idが紐づいていないと購入できない' do
        @purchase_address.exhibit_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Exhibit can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
