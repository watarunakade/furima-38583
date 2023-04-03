FactoryBot.define do
  factory :purchase_address do
    post_code         {'123-1234'}
    area_id           {Faker::Number.between(from: 2, to: 48)}
    address_street    {Faker::Address.street_address}
    address_number    {Faker::Address.secondary_address}
    phone_number      {Faker::Number.number(digits: 10)}
    item_id           {Faker::Number.number(digits: 1)}
    user_id           {Faker::Number.number(digits: 1)}
    token             {"tok_abcdefghijk00000000000000000"}
  end
end
