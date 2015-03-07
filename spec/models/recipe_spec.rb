require 'spec_helper'

describe Recipe do
  it { should have_many(:categories).through(:recipe_categories) }

  describe ".search_by_title" do
    it "returns an empty array when there are no matches" do
      recipe = Fabricate(:recipe, title: "Spaghetti Carbonara")
      expect(Recipe.search_by_title("pizza")).to eq([])
    end

    it "returns an array with recipe when there is a match" do
      recipe = Fabricate(:recipe, title: "Spaghetti Carbonara")
      expect(Recipe.search_by_title("Spaghetti Carbonara")).to eq([recipe])
    end

    it "returns an array with recipe when there is a partial match" do
      recipe = Fabricate(:recipe, title: "Spaghetti Carbonara")
      expect(Recipe.search_by_title("arbo")).to eq([recipe])
    end

    it "returns array with multiple recipes when there are multiple matches ordered by created date" do
      spaghetti1 = Fabricate(:recipe, title: "Spaghetti Carbonara", created_at: 2.days.ago)
      spaghetti2 = Fabricate(:recipe, title: "Spaghetti Bolognese")
      expect(Recipe.search_by_title("spaghetti")).to eq([spaghetti2, spaghetti1])
    end

    it "returns an empty array when there is no input from the user" do
      recipe = Fabricate(:recipe, title: "Spaghetti Carbonara")
      expect(Recipe.search_by_title("")).to eq([])
    end
  end
end
