require 'rails_helper'

RSpec.describe 'recipe index page' do
  #   User Story 1 of 4
  # As a visitor,
  # When I visit '/recipes',
  # I see a list of recipes with the following information:
  # -Name
  # -Complexity
  # -Genre
  # (e.g. "Name: Spaghetti, Complexity: 2, Genre: Italian")
  it "has the name/complexity/genre of each recipe" do
    spaghetti = Recipe.create!(name: "Spaghetti Marinara", complexity: 7, genre: "Italian")
    fettucini = Recipe.create!(name: "Fettucini Alfredo", complexity: 8, genre: "Italian")
    cacio = Recipe.create!(name: "Cacio E Pepe", complexity: 9, genre: "Italian")

    visit "/recipes"
    within "#recipe-#{spaghetti.id}" do
      expect(page).to have_content("Name: Spaghetti Marinara")
      expect(page).to have_content("Complexity: 7")
      expect(page).to have_content("Genre: Italian")
    end
    within "#recipe-#{fettucini.id}" do
      expect(page).to have_content("Name: Fettucini Alfredo")
      expect(page).to have_content("Complexity: 8")
      expect(page).to have_content("Genre: Italian")
    end
    within "#recipe-#{cacio.id}" do
      expect(page).to have_content("Name: Cacio E Pepe")
      expect(page).to have_content("Complexity: 9")
      expect(page).to have_content("Genre: Italian")
    end
  end
  
end
