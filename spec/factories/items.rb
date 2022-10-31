FactoryBot.define do
  factory :item do
    product                {Faker::Lorem.name}
    explanation            {Faker::Lorem.sentence}
    category_id            {'3'}
    situation_id           {'2'}
    delivery_charge_id     {'2'}
    sender_id              {'2'}
    shipping_id            {'2'}
    price                  {Faker::Number.between(from: 300, to: 9_999_999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
