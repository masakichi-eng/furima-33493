FactoryBot.define do
  factory :item do
    category_id { 2 }
    state_id { 2 }
    burden_id { 2 }
    prefecture_id { 2 }
    ship_day_id { 2 }
    explanation { '説明文' }
    price { 500 }
    name { '商品の名前' }
    # image {'url.jpeg'}

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end

    association :user
  end
end
