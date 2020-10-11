FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { '石井' }
    last_name             { '善幸' }
    family_name_kana      { 'イシイ' }
    last_name_kana        { 'ヨシユキ' }
    birth_date            { '1234-12-31' }
  end
end
