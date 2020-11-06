FactoryBot.define do
  factory :user do
		nickname {Faker::Name.name}
		last_name {"田中"}
		first_name  {"太郎"}
		last_name_kana  {"タナカ"}
		first_name_kana  {"タロウ"}
		email {Faker::Internet.free_email}
		birthday { Faker::Date.birthday(min_age: 5, max_age: 90)}

		password              { Faker::Internet.password(min_length: 6)+"1a" }
    password_confirmation {password} 
  end
end