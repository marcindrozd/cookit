require 'spec_helper'

describe RecipeCategory do
  it { should belong_to(:category) }
  it { should belong_to(:recipe) }
end
