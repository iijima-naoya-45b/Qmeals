user_id = User.first.id

FavoriteRecipe.create(
  user_id:,
  recipe_id: 1
)

FavoriteRecipe.create(
  user_id:,
  recipe_id: 2
)
