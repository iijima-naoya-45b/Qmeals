class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  has_many :shopping_lists, dependent: :destroy

  has_many :recipes, dependent: :destroy
  has_many :favorite_recipes, dependent: :destroy
  has_many :favorite_recipe_recipes, through: :favorite_recipes, source: :recipe

  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_ingredients, dependent: :destroy

  has_many :recipe_comments, dependent: :destroy

  has_many :wisdom_boards, dependent: :destroy
  has_many :favorite_wisdoms, dependent: :destroy
  has_many :favorite_wisdom_wisdoms, through: :favorite_wisdoms, source: :wisdom_board
  has_many :wisdom_comments, dependent: :destroy

  def own?(object)
    id == object&.user_id
  end

  def recipe_favorite(recipe)
    favorite_recipe_recipes << recipe
  end

  def recipe_unfavorite(recipe)
    favorite_recipe_recipes.destroy(recipe)
  end

  def recipe_favorite?(recipe)
    favorite_recipe_recipes.include?(recipe)
  end

  def wisdom_board_favorite(wisdom_board)
    favorite_wisdom_wisdoms << wisdom_board
  end

  def wisdom_board_unfavorite(wisdom_board)
    favorite_wisdom_wisdoms.destroy(wisdom_board)
  end

  def wisdom_board_favorite?(wisdom_board)
    favorite_wisdom_wisdoms.include?(wisdom_board)
  end
end
