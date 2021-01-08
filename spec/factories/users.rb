FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    sei_kanji { '田中' }
    mei_kanji { '太郎' }
    sei_katakana { 'タナカ' }
    mei_katakana { 'タロウ' }
    birthday { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
  end
end
