class CreateShoppingLists < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_lists do |t|
      t.string :item, null: false
      t.text :notes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
