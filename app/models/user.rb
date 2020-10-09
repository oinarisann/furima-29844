class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  

  with_options presence: true do
    validates :nickname, length: { maximum: 40 }

    validates :password, format:{ with: /\A[a-zA-Z0-9]+\z/ }, length: { minimum: 6 }

    validates :password_confirmation, format:{ with: /\A[a-zA-Z0-9]+\z/ }, length: { minimum: 6 }

    validates :family_name, format:{ with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name, format:{ with: /\A[ぁ-んァ-ン一-龥]/ }

    validates :family_name_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/}
    validates :last_name_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/}
    validates :birth_date 
  end
end