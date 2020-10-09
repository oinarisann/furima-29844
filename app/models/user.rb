class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, {presence: true, format: { with: /\A\S+@\S+\.\S+\z/ }, uniqueness: { case_sensitive: false }}

  validates :nickname, presence: true, length: { maximum: 40 }

  validates :password, presence: true, format:{ with: /\A[a-zA-Z0-9]+\z/ }, length: { minimum: 6 }

  validates :password_confirmation, presence: true, format:{ with: /\A[a-zA-Z0-9]+\z/ }, length: { minimum: 6 }

  validates :family_name, presence: true, format:{ with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, presence: true, format:{ with: /\A[ぁ-んァ-ン一-龥]/ }

  validates :family_name_kana, presence: true, 
  format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/}
  validates :last_name_kana, presence: true,
  format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/}
  validates :birth_date, presence: true
end
