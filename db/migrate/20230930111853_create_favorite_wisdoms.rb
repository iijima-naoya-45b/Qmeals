class CreateFavoriteWisdoms < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_wisdoms do |t|
      t.references :user, foreign_key: true
      t.references :wisdom_board, foreign_key: true

      t.timestamps
    end
  end
end
