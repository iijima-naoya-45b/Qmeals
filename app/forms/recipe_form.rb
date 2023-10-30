class RecipeForm
  include ActiveModel::Model
  attr_accessor :title, :content, :cooking_time, :ingredient_name, :unit_unit, :photo, :tag_names, :ingredients_attributes,
                :recipe_mains

  validates :title, presence: true, length: { maximum: 500 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :cooking_time, presence: true, length: { maximum: 10 }
  validates :tag_names, presence: true, length: { maximum: 30 }

  def initialize(attributes = {}, user)
    super(attributes)
    @user = user
    @recipe = Recipe.new
    @ingredient_names = Array(attributes.dig(:recipe_form, :ingredients_attributes, :ingredient_name))
    @unit_units = Array(attributes.dig(:recipe_form, :ingredients_attributes, :unit_unit))
  end

  def tag_name=(tag_names)
    @tag_names = tag_names.split(',').map(&:strip).uniq
  end

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      recipe = Recipe.create(title: @title, content: @content, cooking_time: @cooking_time, photo: @photo,
                            user_id: @user.id)
      recipe.recipe_tags = tag_names.map { |name| RecipeTag.find_or_create_by(name:) }

      @ingredients_attributes.each do |_, ingredient_params|
        ingredient_name = ingredient_params['ingredient_name']
        unit_unit = ingredient_params['unit_unit']

        next unless ingredient_name.present? && unit_unit.present?

        ingredient = Ingredient.create(name: ingredient_name)
        unit = Unit.create(unit: unit_unit, ingredient_id: ingredient.id)
        RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id)
      end

      @recipe_mains.each do |_, recipe_params|
        description = recipe_params['description']
      
        if description.present?
          recipe.recipe_photos.create(description: description)
        end
      end
      true
    end
  end
end