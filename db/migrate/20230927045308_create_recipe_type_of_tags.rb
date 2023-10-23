class CreateRecipeTypeOfTags < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_type_of_tags do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :recipe_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
