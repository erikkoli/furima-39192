class CreateExhibits < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibits do |t|
      t.string       :product, null: false
      t.text         :explain, null: false
      t.integer      :price, null: false
      t.integer      :category_id, null: false
      t.integer      :condition_id, null: false
      t.integer      :postage_id, null: false
      t.integer      :prefecture_id, null: false
      t.integer      :shipment_id, null: false
      t.references   :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
