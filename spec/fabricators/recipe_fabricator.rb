Fabricator(:recipe) do
  title { Faker::Lorem.word }
  directions { Faker::Lorem.paragraph(2) }
  ingredients { Faker::Lorem.words(5).join(" ") }
end
