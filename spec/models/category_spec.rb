require 'spec_helper'

describe Category do
  it { should have_many(:recipes).through(:recipe_categories) }

  describe "#recent_recipes" do
    it "returns all recipes if there is less than 5 recipes in the category" do
      category = Fabricate(:category)

      recipe1 = Fabricate(:recipe, categories: [category])
      recipe2 = Fabricate(:recipe, categories: [category])
      recipe3 = Fabricate(:recipe, categories: [category])

      expect(category.recent_recipes).to match_array([recipe1, recipe2, recipe3])
    end


    it "returns 5 recent recipes ordered by created date descending" do
      category = Fabricate(:category)

      recipe1 = Fabricate(:recipe, categories: [category])
      recipe2 = Fabricate(:recipe, categories: [category], created_at: 1.day.ago)
      recipe3 = Fabricate(:recipe, categories: [category], created_at: 2.days.ago)
      recipe4 = Fabricate(:recipe, categories: [category])
      recipe5 = Fabricate(:recipe, categories: [category])
      recipe6 = Fabricate(:recipe, categories: [category])

      expect(category.recent_recipes).to eq([recipe6, recipe5, recipe4, recipe1, recipe2])
    end

    it "returns an empty array if category has no recipes" do
      category = Fabricate(:category)

      expect(category.recent_recipes).to eq([])
    end
  end
end
