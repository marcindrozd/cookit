require 'spec_helper'

describe Category do
  it { should have_many(:recipes).through(:recipe_categories) }
end
