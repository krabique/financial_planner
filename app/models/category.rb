# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :categorizable, polymorphic: true
  has_many :sub_categories, as: :categorizable, dependent: :destroy,
                            inverse_of: :categorizable, class_name: 'Category'
  belongs_to :user

  validates :name, length: {in: 1..80}
end
