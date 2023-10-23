class CreateWisdomTypeOfTags < ActiveRecord::Migration[7.0]
  def change
    create_table :wisdom_type_of_tags do |t|
      t.references :wisdom_board, foreign_key: true
      t.references :wisdom_tag, foreign_key: true

      t.timestamps
    end
  end
end
