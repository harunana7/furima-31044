class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :telephone, :item_id, :token, :user_id

	with_options presence: true do
    # 「住所」の郵便番号に関するバリデーション
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :token
    # 「住所」の都道府県に関するバリデーション
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :telephone
  end

  def save

    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone: telephone, order_id: order.id)

  end

end