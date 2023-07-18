require 'faker'
FactoryBot.define do
    factory :user do
        name { Faker::Name.name}
        email { Faker::Internet.email }
        password { Faker::Internet.password(min_length: 6)}
    end

    factory :article do
        title { Faker::Lorem.sentence }
        content { Faker::Lorem.paragraph }
        association :user
    end
end