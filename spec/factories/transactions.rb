# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    amount      { Faker::Number.decimal(2) }
    comment     { Faker::DrWho.quote[0..79] }
    user
    date { Time.current }

    factory :invalid_transaction do
      amount { 'abc' }
    end

    trait :one_day_ago do
      date { Time.current - 1.day }
    end

    trait :two_days_ago do
      date { Time.current - 2.days }
    end
  end
end
