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
   validates :last_name, format:{ with: /\A[ぁ-んァ-ン一-龥]/}
   validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
   validates :last_name_kana, format:{ with: /\A[ァ-ヶー－]+\z/}
   validates :first_name_kana, format:{ with: /\A[ァ-ヶー－]+\z/}
   validates :birthday
 end     

  has_many :items


  # validates :nickname, presence: true, length: { maximum: 6 }
end
