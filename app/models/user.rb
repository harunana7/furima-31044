class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nicname, presence: true
         validates :name, presence: true
         validates :furigana, presence: true
         validates :birth_date, presence: true
end
