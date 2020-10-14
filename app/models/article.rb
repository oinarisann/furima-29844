class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :charges
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping

  #空の投稿を保存できないようにする
  validates :name, :description, :genre_id, :status_id, :charges_id, :prefecture_id, :shipping_id, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :genre_id, :status_id, :charges_id, :prefecture_id, :shipping_id, numericality: { other_than: 1 } 
end
