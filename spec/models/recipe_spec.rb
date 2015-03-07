require 'spec_helper'

describe Recipe do
  it { should have_many(:categories).through(:recipe_categories) }
end
