class WisdomTag < ApplicationRecord
  has_many :wisdom_type_of_tags, dependent: :destroy
  has_many :wisdom_boards, through: :wisdom_type_of_tags
end
