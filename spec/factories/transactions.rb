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
  end
end
