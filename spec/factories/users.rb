FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password '1'"a"}
    password_confirmation {password}
    family_name           {"ほげ"}
    first_name            {"ほげ"}
    kana_family_name      {"ホゲ"}
    kana_first_name       {"ホゲ"}
    birthday              {'1999/01/01'}
  end
end