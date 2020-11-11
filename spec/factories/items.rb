FactoryBot.define do
  factory :item do
   association :user

    after(:build) do |item|
     item.image.attach(io: File.open('public/images/ねこ.jpg'), filename: 'ねこ.jpg')
   end

    name {Faker::Name.name}
    explanation {"aaa"}
    price {111}
    category_id {2}
    condition_id {2}
    delivery_fee_id {2}
    ship_from_location_id {2}
    delivery_period_id {2}
  end
end
