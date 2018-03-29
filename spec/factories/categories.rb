# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { Faker::DrWho.quote[0..79] }
  end
end
