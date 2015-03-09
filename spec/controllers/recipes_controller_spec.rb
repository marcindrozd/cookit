require 'spec_helper'

describe RecipesController do
  describe "GET index" do
    it "assigns sets @categories variable to all categories" do
      desserts = Fabricate(:category, name: "Desserts")
      main_courses = Fabricate(:category, name: "Main Courses")
      get :index
      expect(assigns(:categories)).to match_array([desserts, main_courses])
    end
  end

  describe "GET search" do
    it "sets @recipes variable to array when there is a match" do
      recipe = Fabricate(:recipe, title: "Spaghetti")
      get :search, recipe: "ghett"
      expect(assigns(:recipes)).to eq([recipe])
    end
  end

  describe "GET show" do
    it "sets @recipe variable" do
      recipe = Fabricate(:recipe, title: "Spaghetti")
      get :show, id: recipe.id
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe "GET new" do
    it "creates new @recipe object" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(assigns(:recipe)).to be_instance_of(Recipe)
    end
  end

  describe "POST create" do
    context "with authenticated user" do
      let(:bob) { Fabricate(:user) }

      it "creates a new recipe" do
        session[:user_id] = bob.id
        post :create, recipe: Fabricate.attributes_for(:recipe)
        expect(Recipe.count).to eq(1)
      end

      it "creates a new recipe associated with current user" do
        session[:user_id] = bob.id
        post :create, recipe: Fabricate.attributes_for(:recipe)
        expect(Recipe.first.creator).to eq(bob)
      end

      it "adds correct categories to the new recipe" do
        desserts = Fabricate(:category, name: "Desserts")
        starters = Fabricate(:category, name: "Starters")
        session[:user_id] = bob.id
        post :create, recipe: Fabricate.attributes_for(:recipe, category_ids: [desserts.id, starters.id])
        expect(Recipe.first.categories).to match_array([desserts, starters])
      end

      it "redirects to newly created recipe page" do
        session[:user_id] = bob.id
        post :create, recipe: Fabricate.attributes_for(:recipe)
        recipe = Recipe.first
        expect(response).to redirect_to recipe
      end
    end

    context "with unathenticated user" do
      it "does not create a new recipe" do
        post :create, recipe: Fabricate.attributes_for(:recipe)
        expect(Recipe.count).to eq(0)
      end

      it "redirects to the root path" do
        post :create, recipe: Fabricate.attributes_for(:recipe)
        expect(response).to redirect_to root_path
      end

      it "displays error message" do
        post :create, recipe: Fabricate.attributes_for(:recipe)
        expect(flash[:danger]).not_to be_blank
      end
    end
  end

  describe "GET edit" do
    context "with creator of the recipe" do
      let(:bob) { Fabricate(:user) }

      it "assigns @recipe variable to existing recipe" do
        session[:user_id] = bob.id
        recipe = Fabricate(:recipe)
        get :edit, id: recipe.id
        expect(assigns(:recipe)).to eq(recipe)
      end
    end

    context "with authenticated user who is not creator of the recipe" do
      let(:bob) { Fabricate(:user) }

      it "redirects to root path" do
        alice = Fabricate(:user)
        session[:user_id] = bob.id
        recipe = Fabricate(:recipe, creator: alice)
        get :edit, id: recipe.id
        expect(response).to redirect_to root_path
      end

      it "flashes an error message" do
        alice = Fabricate(:user)
        session[:user_id] = bob.id
        recipe = Fabricate(:recipe, creator: alice)
        get :edit, id: recipe.id
        expect(flash[:danger]).not_to be_blank
      end
    end

    context "with unauthenticated user" do
      it "redirects to root path" do
        recipe = Fabricate(:recipe)
        get :edit, id: recipe.id
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "PATCH update" do
    context "with authenticated creator" do
      it "updates the recipe" do
        bob = Fabricate(:user)
        session[:user_id] = bob.id
        recipe = Fabricate(:recipe, creator: bob)
        patch :update, id: recipe.id, recipe: Fabricate.attributes_for(:recipe, title: "Pizza")
        expect(Recipe.first.title).to eq("Pizza")
      end
    end

    context "with authenticated user who is not creator of the recipe" do
      it "does not update the recipe" do
        bob = Fabricate(:user)
        session[:user_id] = bob.id
        recipe = Fabricate(:recipe, creator: Fabricate(:user))
        patch :update, id: recipe.id, recipe: Fabricate.attributes_for(:recipe, title: "Pizza")
        expect(Recipe.first.title).not_to eq("Pizza")
      end

      it "redirects to root path" do
        bob = Fabricate(:user)
        session[:user_id] = bob.id
        recipe = Fabricate(:recipe, creator: Fabricate(:user))
        patch :update, id: recipe.id, recipe: Fabricate.attributes_for(:recipe, title: "Pizza")
        expect(response).to redirect_to root_path
      end
    end

    context "with unauthenticated user" do
      it "redirects to root path" do
        recipe = Fabricate(:recipe)
        patch :update, id: recipe.id, recipe: Fabricate.attributes_for(:recipe, title: "Pizza")
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "DELETE destroy" do
    context "with authenticated creator" do
      it "destroys the recipe" do
        bob = Fabricate(:user)
        session[:user_id] = bob.id
        recipe = Fabricate(:recipe, creator: bob)
        delete :destroy, id: recipe.id
        expect(Recipe.count).to eq(0)
      end
    end

    context "with authenticated user who is not creator of the recipe" do
      it "does not destroy the recipe" do
        bob = Fabricate(:user)
        session[:user_id] = bob.id
        recipe = Fabricate(:recipe, creator: Fabricate(:user))
        delete :destroy, id: recipe.id
        expect(Recipe.count).to eq(1)
      end

      it "redirects to root path" do
        bob = Fabricate(:user)
        session[:user_id] = bob.id
        recipe = Fabricate(:recipe, creator: Fabricate(:user))
        delete :destroy, id: recipe.id
        expect(response).to redirect_to root_path
      end
    end

    context "with unauthenticated user" do
      it "does not destroys the recipe" do
        recipe = Fabricate(:recipe)
        delete :destroy, id: recipe.id
        expect(Recipe.count).to eq(1)
      end

      it "redirects to root path" do
        recipe = Fabricate(:recipe)
        delete :destroy, id: recipe.id
        expect(response).to redirect_to root_path
      end
    end
  end
end
