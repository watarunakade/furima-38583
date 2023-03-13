FactoryBot.define do
  factory :item do
    item_name    {Faker::Lorem.words}
    item_text    {Faker::Lorem.sentence}
    category_id  {Faker::Number.between(from: 2, to: 11)}
    condition_id {Faker::Number.between(from: 2, to: 7)}
    area_id      {Faker::Number.between(from: 2, to: 48)}
    postage_id   {Faker::Number.between(from: 2, to: 4)}
    sendday_id   {Faker::Number.between(from: 2, to: 4)}
    price        {Faker::Number.between(from: 300, to: 9999999)}
    association  :user
  end
end
