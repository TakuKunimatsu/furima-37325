FactoryBot.define do
  factory :order_shipping_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '東京都' }
    addresses { '1-1' }
    building { '東京ハイツ' }
    phone_number { Faker::Number.number(digits: 11) }
  end
end
