FactoryBot.define do
  factory :purchase_shipping do
    postal { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number{'09012345678'}
    token {'aaaaaaaaaaaaaaaaaaaaa'}
  end
end
