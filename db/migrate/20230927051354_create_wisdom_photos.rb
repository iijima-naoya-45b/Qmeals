class CreateWisdomPhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :wisdom_photos do |t|
      t.string :image
      t.text :description
      t.references :wisdom_board, foreign_key: true

      t.timestamps
    end
  end
end
