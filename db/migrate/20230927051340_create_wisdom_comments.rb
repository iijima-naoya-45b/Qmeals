class CreateWisdomComments < ActiveRecord::Migration[7.0]
  def change
    create_table :wisdom_comments do |t|
      t.string :comment
      t.references :user, foreign_key: true
      t.references :wisdom_board, foreign_key: true

      t.timestamps
    end
  end
end
