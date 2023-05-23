require 'rails_helper'

RSpec.describe Exhibit, type: :model do
  before do
    @exhibit = FactoryBot.build(:exhibit)
  end

  describe '商品投稿' do
    context '新規作成できる場合' do
      it 'product, explain, price, category_id, condition_id, prefecture_id, postage_id, shipment_idの値が存在すれば作成できる' do
        expect(@exhibit).to be_valid
      end
    end
    context '新規作成できない場合' do
      it 'productが空では作成できない' do
        @exhibit.product = ''
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include("商品名を入力してください")
      end
      it 'explainが空では作成できない' do
        @exhibit.explain = ''
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'priceが空では作成できない' do
        @exhibit.price = ''
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include("金額は数値で入力してください")
      end
      it 'priceが全角では作成できない' do
        @exhibit.price = '５００'
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include('金額は数値で入力してください')
      end
      it 'priceが半角でも文字では作成できない' do
        @exhibit.price = 'ﾀﾅｶ'
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include('金額は数値で入力してください')
      end
      it 'priceが300未満では作成できない' do
        @exhibit.price = 299
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include('金額は300以上の値にしてください')
      end
      it 'priceが10000000以上では作成できない' do
        @exhibit.price = 10_000_000
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include('画像を入力してください')
      end
      it 'category_idが初期値では作成できない' do
        @exhibit.category_id = 1
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'condition_idが初期値では作成できない' do
        @exhibit.condition_id = 1
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include("商品状態を選択してください")
      end
      it 'prefecture_idが初期値では作成できない' do
        @exhibit.prefecture_id = 1
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include("発送元を選択してください")
      end
      it 'postage_idが初期値では作成できない' do
        @exhibit.postage_id = 1
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include("送料の負担を選択してください")
      end
      it 'shipment_idが初期値では作成できない' do
        @exhibit.shipment_id = 1
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include("発送日数を選択してください")
      end
      it 'userが紐付いていなければ出品できない' do
        @exhibit.user = nil
        @exhibit.valid?
        expect(@exhibit.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
