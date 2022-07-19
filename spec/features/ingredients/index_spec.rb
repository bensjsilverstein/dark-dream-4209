# User Story 3 of 4
# As a visitor,
# When I visit '/ingredients'
# I see a list of ingredients and the number of recipes each ingredient is used in.
# (e.g. "Ground Beef: 2"
#      "Salt: 4")
require 'rails_helper'
RSpec.describe 'ingredient index page' do
  it "has a list of the ingredients and the number of recipes each ingredient is used in" do
    spaghetti = Recipe.create!(name: "Spaghetti Marinara", complexity: 7, genre: "Italian")
    fettucini = Recipe.create!(name: "Fettucini Alfredo", complexity: 8, genre: "Italian")

    pasta = Ingredient.create!(name: "Pasta", cost: 5)
    tomato = Ingredient.create!(name: "Tomato", cost: 3)
    cream = Ingredient.create!(name: "Cream", cost: 4)

    recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
    recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: tomato.id)
    recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: fettucini.id, ingredient_id: cream.id)
    recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: fettucini.id, ingredient_id: pasta.id)

    visit "/ingredients"

    # expect(page).to have_content("Ingredient: Pasta")
    # expect(page).to have_content("Ingredient: Tomato")
    # expect(page).to have_content("Ingredient: Cream")
    #
    within "#ingredient-#{pasta.id}" do
      expect(page).to have_content("Pasta: 2")
    end
    within "#ingredient-#{tomato.id}" do
      expect(page).to have_content("Tomato: 1")
    end
    within "#ingredient-#{cream.id}" do
      expect(page).to have_content("Cream: 1")
    end
  end
end
