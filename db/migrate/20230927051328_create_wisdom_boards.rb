class CreateWisdomBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :wisdom_boards do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
