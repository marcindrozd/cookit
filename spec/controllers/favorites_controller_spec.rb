require 'spec_helper'

describe FavoritesController do
  describe "POST create" do
    context "with authenticated user" do
      let(:bob) { Fabricate(:user) }

      it "redirects to current user profile page for signed in user" do
        recipe = Fabricate(:recipe)
        session[:user_id] = bob.id
        post :create, recipe_id: recipe.id
        expect(response).to redirect_to bob
      end

      it "creates a new favorite recipe" do
        recipe = Fabricate(:recipe)
        session[:user_id] = bob.id
        post :create, recipe_id: recipe.id
        expect(Favorite.count).to eq(1)
      end

      it "creates a new favorite for current recipe" do
        recipe = Fabricate(:recipe, title: "Pizza")
        session[:user_id] = bob.id
        post :create, recipe_id: recipe.id
        expect(Favorite.first.recipe.title).to eq("Pizza")
      end

      it "creates a new favorite associated with current user" do
        recipe = Fabricate(:recipe)
        session[:user_id] = bob.id
        post :create, recipe_id: recipe.id, user: bob
        expect(Favorite.first.user).to eq(bob)
      end

      it "does not add recipe to favorites if it is already in favorites" do
        recipe = Fabricate(:recipe)
        session[:user_id] = bob.id
        Favorite.create(recipe_id: recipe.id, user: bob)
        post :create, recipe_id: recipe.id, user: bob
        expect(Favorite.count).to eq(1)
      end

      it "does not add recipe to favorites if the current user is the recipe creator" do
        recipe = Fabricate(:recipe, creator: bob)
        session[:user_id] = bob.id
        post :create, recipe_id: recipe.id, user: bob
        expect(Favorite.count).to eq(0)
      end
    end

    context "with unauthenticated user" do
      it "redirects to root path" do
        recipe = Fabricate(:recipe)
        post :create, recipe_id: recipe.id
        expect(response).to redirect_to root_path
      end

      it "does not add recipe to favorites" do
        recipe = Fabricate(:recipe)
        post :create, recipe_id: recipe.id
        expect(Favorite.count).to eq(0)
      end

      it "displays error message" do
        recipe = Fabricate(:recipe)
        post :create, recipe_id: recipe.id
        expect(flash[:danger]).not_to be_blank
      end
    end
  end

  describe "DELETE destroy" do
    context "for authenticated user" do
      it "redirects to user's page" do
        bob = Fabricate(:user)
        session[:user_id] = bob.id
        recipe = Fabricate(:recipe)
        favorite = Favorite.create(recipe_id: recipe.id, user: bob)
        delete :destroy, id: favorite.id
        expect(response).to redirect_to bob
      end

      it "removes a recipe from the favorites" do
        bob = Fabricate(:user)
        session[:user_id] = bob.id
        recipe = Fabricate(:recipe)
        favorite = Favorite.create(recipe_id: recipe.id, user: bob)
        delete :destroy, id: favorite.id
        expect(Favorite.count).to eq(0)
      end

      it "does not remove a recipe from other user's favorites" do
        bob = Fabricate(:user)
        alice = Fabricate(:user)
        session[:user_id] = bob.id
        recipe = Fabricate(:recipe)
        favorite = Favorite.create(recipe_id: recipe.id, user: alice)
        delete :destroy, id: favorite.id
        expect(Favorite.count).to eq(1)
      end
    end

    context "for unauthenticated user" do
      it "redirects to root path" do
        recipe = Fabricate(:recipe)
        favorite = Favorite.create(recipe_id: recipe.id)
        delete :destroy, id: favorite.id
        expect(response).to redirect_to root_path
      end

      it "displays error message" do
        recipe = Fabricate(:recipe)
        favorite = Favorite.create(recipe_id: recipe.id)
        delete :destroy, id: favorite.id
        expect(flash[:danger]).not_to be_blank
      end
    end
  end
end
