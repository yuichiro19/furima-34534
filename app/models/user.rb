class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_hurigana, presence: true
  validates :first_name_hurigana, presence:true
  validates :birthday, presence: true
  
end
