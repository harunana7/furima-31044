require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it 'nameとexplanation、image、price、category_id、condition_id、delivery_fee_id、ship_from_location_id、delivery_period_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
  end

  context '出品がうまくいかないとき' do
    it 'nameが空だと登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'explanationが空では登録できない' do
      @item.explanation = ' '
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'imageが空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'category_idが空では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it 'condition_idが空では登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end
    it 'delivery_fee_idが空では登録できない' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
    end
    it 'ship_from_location_idが空では登録できない' do
      @item.ship_from_location_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Ship from location must be other than 1')
    end
    it 'delivery_period_idが空では登録できない' do
      @item.delivery_period_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery period must be other than 1')
    end
    it 'priceが300以下では登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceが9999999以上では登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end
