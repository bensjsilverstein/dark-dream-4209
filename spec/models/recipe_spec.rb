require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end
  describe 'model methods' do
    it "#{}ingredient_cost" do
      spaghetti = Recipe.create!(name: "Spaghetti Marinara", complexity: 7, genre: "Italian")
      fettucini = Recipe.create!(name: "Fettucini Alfredo", complexity: 8, genre: "Italian")
      cacio = Recipe.create!(name: "Cacio E Pepe", complexity: 9, genre: "Italian")

      ingredient = Ingredient.create!(name: "Salt",cost: 1)
      ingredient_2 = Ingredient.create!(name: "Pepper",cost: 4)

      recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: ingredient.id)
      recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: fettucini.id, ingredient_id: ingredient.id)
      recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: ingredient_2.id)

      expect(spaghetti.ingredient_cost).to eq(5)
    end
  end

end
