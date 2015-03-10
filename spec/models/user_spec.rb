require 'spec_helper'

describe User do
  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:email_address) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:email_address) }
  it { should have_many(:recipes) }
  it { should have_many(:favorites) }

  describe "#can_add?(recipe)" do
    it "returns true when recipe not in the users favorites" do
      bob = Fabricate(:user)
      recipe = Fabricate(:recipe)
      expect(bob.can_add?(recipe)).to be_truthy
    end

    it "returns true when recipe not in favorites and the user is not the recipe creator" do
      alice = Fabricate(:user)
      bob = Fabricate(:user)
      recipe = Fabricate(:recipe, creator: alice)
      expect(bob.can_add?(recipe)).to be_truthy
    end

    it "returns false if the recipe is already in favorites" do
      bob = Fabricate(:user)
      recipe = Fabricate(:recipe)
      Favorite.create(recipe_id: recipe.id, user: bob)
      expect(bob.can_add?(recipe)).to be_falsey
    end

    it "returns false if recipe is not in favorites but the user is recipe creator" do
      bob = Fabricate(:user)
      recipe = Fabricate(:recipe, creator: bob)
      expect(bob.can_add?(recipe)).to be_falsey
    end
  end
end
