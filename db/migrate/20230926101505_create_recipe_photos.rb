# recipeに対する複数の写真・及び説明するためのテーブル
class CreateRecipePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_photos do |t|
      t.string :image
      t.text :description
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
