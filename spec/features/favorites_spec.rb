require 'spec_helper'

feature "Using favorites feature" do
  scenario "user signs in and adds recipes to favorites" do
    lisa = Fabricate(:user)
    main_dishes = Fabricate(:category)
    pizza = Fabricate(:recipe, title: "Pizza", category_ids: [main_dishes.id], creator: lisa)
    bob = Fabricate(:user)

    visit('/sign_in')
    fill_in('Email address', with: bob.email_address)
    fill_in('Password', with: bob.password)
    click_button('Sign in')

    visit home_path
    save_and_open_page
    find("a[href='/recipes/#{pizza.id}']").click
    find("a[href='/favorites?recipe_id=#{pizza.id}']").click

    expect(page).to have_content(pizza.title)
    expect(page).to have_content("Favorite recipes")

    visit "/recipes/#{pizza.id}"
    expect(page).not_to have_content("+ Add to favorites")
  end
end
