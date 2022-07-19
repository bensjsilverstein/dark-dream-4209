require 'rails_helper'

RSpec.describe 'recipe show page' do
  # User Story 2 of 4
  # As a visitor,
  # When I visit '/recipes/:id'
  # I see a list of the names of the ingredients the recipe has.
  # (e.g. "Pasta, Meat, Cheese")
  it "shows a list of the names of the ingredients of the recipe" do
    spaghetti = Recipe.create!(name: "Spaghetti Marinara", complexity: 7, genre: "Italian")
    fettucini = Recipe.create!(name: "Fettucini Alfredo", complexity: 8, genre: "Italian")

    pasta = Ingredient.create!(name: "Pasta", cost: 5)
    tomato = Ingredient.create!(name: "Tomato", cost: 3)
    cream = Ingredient.create!(name: "Cream", cost: 4)

    recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
    recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: tomato.id)
    recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: fettucini.id, ingredient_id: cream.id)
    recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: fettucini.id, ingredient_id: pasta.id)

    visit "/recipes/#{spaghetti.id}"

    expect(page).to have_content("Pasta")
    expect(page).to have_content("Tomato")
    expect(page).to have_no_content("Cream")

    visit "/recipes/#{fettucini.id}"

    expect(page).to have_content("Pasta")
    expect(page).to have_content("Cream")
    expect(page).to have_no_content("Tomato")
  end
#   User Story 4 of 4
# As a visitor,
# When I visit '/recipes/:id'
# I see the total cost of all of the ingredients in the recipe.
# (e.g. "Total Cost: 22")
  it "shows the total cost of all the ingredients in the recipe" do
    spaghetti = Recipe.create!(name: "Spaghetti Marinara", complexity: 7, genre: "Italian")
    fettucini = Recipe.create!(name: "Fettucini Alfredo", complexity: 8, genre: "Italian")

    pasta = Ingredient.create!(name: "Pasta", cost: 5)
    tomato = Ingredient.create!(name: "Tomato", cost: 3)
    cream = Ingredient.create!(name: "Cream", cost: 4)

    recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: pasta.id)
    recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: tomato.id)
    recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: fettucini.id, ingredient_id: cream.id)
    recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: fettucini.id, ingredient_id: pasta.id)

    visit "recipes/#{spaghetti.id}"

    expect(page).to have_content("Recipe Cost: $8")
  end
end
