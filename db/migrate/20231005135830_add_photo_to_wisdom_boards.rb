class AddPhotoToWisdomBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :wisdom_boards, :photo, :string
  end
end
