# recipeのコメントテーブル作成
class CreateRecipeComments < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_comments do |t|
      t.text :body

      t.references :user, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
