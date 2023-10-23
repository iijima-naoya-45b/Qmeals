class RecipePhoto < ApplicationRecord
  mount_uploader :image, RecipeImageUploader
  belongs_to :recipe
end
