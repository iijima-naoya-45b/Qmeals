class RemoveImageColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipe_photos, :image, :string
    remove_column :wisdom_photos, :image, :string
  end
end
