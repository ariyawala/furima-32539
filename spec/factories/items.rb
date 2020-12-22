FactoryBot.define do
  factory :item do
    item_name            { Faker::Lorem.sentence }
    item_description     { Faker::Lorem.sentence }
    category_id          { 2 }
    condition_id         { 2 }
    shipping_charge_id   { 2 }
    prefecture_id        { 2 }
    dispatch_timing_id   { 2 }
    price                { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
