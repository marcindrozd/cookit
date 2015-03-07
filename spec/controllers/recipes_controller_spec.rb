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
end
