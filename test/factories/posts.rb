FactoryBot.use_parent_strategy = false
FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    published {
      random = rand(0..1)
      random == 1
    }
    user
  end
end
