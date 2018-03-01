# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email             { Faker::Internet.email }
    name              { Faker::DrWho.character }
    password          { Faker::Internet.password }
    confirmed_at      { Time.current }

    factory :unconfirmed_user do
      confirmed_at { nil }
    end
  end
end
