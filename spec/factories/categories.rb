# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { Faker::DrWho.specie }

    factory :category_not_nested do
      user { categorizable }
      association :categorizable, factory: :user
    end

    factory :category_nested do
      user { categorizable.user }
      association :categorizable, factory: :category_not_nested
    end

    factory :invalid_category do
      name nil
    end
  end
end

# FactoryBot.create(:category_nested, categorizable: (FactoryBot.create(:category_not_nested, user: u)))
