ingredient1 = Ingredient.create(name: '鶏肉')
ingredient2 = Ingredient.create(name: 'ごぼう')

RecipeIngredient.create(recipe_id: 1, ingredient: ingredient1)
RecipeIngredient.create(recipe_id: 1, ingredient: ingredient2)

unit1 = Unit.create(ingredient_id: 1, unit: '400g')
unit2 = Unit.create(ingredient_id: 2, unit: '1本')
