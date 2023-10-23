class ShoppingList < ApplicationRecord
  belongs_to :user

  validates :item, presence: true, length: { maximum: 30 }
  validates :notes, length: { maximum: 30 }
end
