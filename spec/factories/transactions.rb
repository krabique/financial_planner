# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    amount      { Faker::Number.decimal(2) }
    comment     { Faker::DrWho.quote }
    user
    date { Time.current }
  end
end
