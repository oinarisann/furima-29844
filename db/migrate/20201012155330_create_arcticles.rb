class CreateArcticles < ActiveRecord::Migration[6.0]
  def change
    create_table :arcticles do |t|
      t.string     :name                , null: false
      t.text       :description         , null: false
      t.integer    :genre_id            , null: false 
      t.integer    :status_id           , null: false
      t.integer    :charges_id          , null: false
      t.integer    :prefecture_id       , null: false
      t.integer    :shipping_id    , null: false
      t.string     :price               , null: false
      t.timestamps
    end
  end
end
