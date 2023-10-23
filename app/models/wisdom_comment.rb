class WisdomComment < ApplicationRecord
  belongs_to :user
  belongs_to :wisdom_board

  validates :comment, presence: true
end
