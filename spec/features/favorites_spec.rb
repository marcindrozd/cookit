require 'spec_helper'

feature "Using favorites feature" do
  given(:lisa) { Fabricate(:user) }
  given(:bob) { Fabricate(:user) }
  given(:main_dishes) { Fabricate(:category) }
  given(:pizza) { Fabricate(:recipe, title: "Pizza", category_ids: [main_dishes.id],
                                    creator: lisa) }

  scenario "user signs in and adds recipes to favorites" do
    sign_in(bob)

    add_recipe_to_favorites(pizza)
    recipe_should_be_in_favorites(pizza)

    link_should_not_be_present(pizza, "+ Add to favorites")
  end
end

def add_recipe_to_favorites(recipe)
  visit home_path
  find("a[href='/recipes/#{recipe.id}']").click
  find("a[href='/favorites?recipe_id=#{recipe.id}']").click
end

def recipe_should_be_in_favorites(recipe)
  expect(page).to have_content(recipe.title)
  expect(page).to have_content("Favorite recipes")
end

def link_should_not_be_present(recipe, link_title)
  visit "/recipes/#{recipe.id}"
  expect(page).not_to have_content(link_title)
end
