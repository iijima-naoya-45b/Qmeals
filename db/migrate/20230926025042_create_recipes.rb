# recipeテーブル作成用
class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :photo
      t.integer :cooking_time, null: false

      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
