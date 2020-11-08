class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,}\z/i
            validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX, message: "Include both letters and numbers"}

with_options presence: true do
  validates :nickname
  validates :birthday
end

  with_options presence: true, format: { with:/\A[ぁ-んァ-ン一-龥]/} do
    validates :first_name
    validates :last_name
end

with_options presence: true, format: { with:/\A[ァ-ヶー－]+\z/} do
    validates :first_name_kana
    validates :last_name_kana
  end 

  has_many :items
  
end
