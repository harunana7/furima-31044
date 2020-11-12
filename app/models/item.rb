class Item < ApplicationRecord
	belongs_to :user
	has_one :order
	has_one_attached :image

	extend ActiveHash::Associations::ActiveRecordExtensions
	belongs_to_active_hash :category
	belongs_to_active_hash :condition
	belongs_to_active_hash :delivery_fee
	belongs_to_active_hash :ship_from_location
	belongs_to_active_hash :delivery_period

	#空の投稿を保存できないようにする
	validates :name, :image, :explanation, :price, presence: true

	#ジャンルの選択が「--」の時は保存できないようにする
	validates :category_id, :condition_id, :delivery_fee_id, :ship_from_location_id, :delivery_period_id, numericality: { other_than: 1 } 

  #¥300~¥9999999までの金額であれば出品できるようにする
	validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
