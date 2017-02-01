class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :img_url
      t.float :price
      t.integer :quantity
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
