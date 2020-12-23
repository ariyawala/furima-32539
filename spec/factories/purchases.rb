FactoryBot.define do
  factory :purchase do
    zip { '111-1111' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '東京1-1' }
    building { '東京ビル101' }
    phone_no { '00011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
