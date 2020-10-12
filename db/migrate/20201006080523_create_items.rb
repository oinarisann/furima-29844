class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,foreign_key: true
      t.string     :name
      t.text       :description #説明文
      t.integer    :price
      t.integer    :category_id
      t.integer    :status_id
      t.integer    :prefecture_id
      t.integer    :shipping_date
      t.timestamps
    end
  end
end
