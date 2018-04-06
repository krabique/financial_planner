# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :user
  belongs_to :categorizable, polymorphic: true
  has_many :sub_categories, as: :categorizable, dependent: :destroy,
                            inverse_of: :categorizable, class_name: 'Category'

  has_many :transactions, dependent: :destroy

  validates :name, length: {in: 1..80}
end
