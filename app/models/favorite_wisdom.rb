class FavoriteWisdom < ApplicationRecord
  belongs_to :user
  belongs_to :wisdom_board

  validates :user_id, uniqueness: { scope: :wisdom_board_id }
end
