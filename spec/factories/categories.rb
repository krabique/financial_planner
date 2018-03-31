# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { Faker::DrWho.quote[0..79] }

    factory :category_not_nested do
      user { categorizable }
      association :categorizable, factory: :user
    end

    factory :category_nested do
      user { categorizable.user }
      association :categorizable, factory: :category_not_nested
    end
  end
end
