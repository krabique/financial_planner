# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :categorizable, polymorphic: true
  has_many :categories, as: :categorizable, dependent: :destroy, inverse_of: :categorizable
end
