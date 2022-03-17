FactoryBot.define do
  factory :user do
    user = Gimei.name

    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)
    password {password}
    password_confirmation {password}
    last_name {user.last.kanji}
    first_name {user.first.kanji}
    last_name_kana {user.last.katakana}
    first_nam_kana {user.first.katakana}
    birth_date { Faker::Date.backward }
  end
end