# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    amount      { Faker::Number.decimal(2) }
    kind        'income'
    comment     { Faker::DrWho.quote }
    user
    date { Time.current }

    trait :income do
      kind    'income'
    end

    trait :expense do
      kind    'expense'
    end
  end
end
