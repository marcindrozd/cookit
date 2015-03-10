require 'spec_helper'

feature 'Signing In' do
  given(:bob) { Fabricate(:user) }

  scenario "signs in with correct credentials" do
    visit('/sign_in')
    fill_in('Email address', with: bob.email_address)
    fill_in('Password', with: bob.password)
    click_button('Sign in')
    expect(page).to have_content("You've been successfully logged in!")
    expect(page).to have_content("Sign Out")
  end

  scenario "does not sign in with incorrect credentials" do
    visit('/sign_in')
    fill_in('Email address', with: bob.email_address)
    fill_in('Password', with: "wrong password")
    click_button('Sign in')
    expect(page).to have_content("There is something wrong with your email address or password!")
    expect(page).to have_content("Log In")
  end
end
