FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"hoge"}
    first_name            {"hoge"}
    kana_family_name      {"ホゲ"}
    kana_first_name       {"ホゲ"}
    birthday              {'1999/01/01'}
  end
end