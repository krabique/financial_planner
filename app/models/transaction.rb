# frozen_string_literal: true

class Transaction < ApplicationRecord
  extend Enumerize

  KIND_TYPES = %i[income expense transfer].freeze

  enumerize :kind, in: KIND_TYPES

  belongs_to :category, optional: true
  belongs_to :origin, class_name: 'Category', optional: true, inverse_of: :transactions
  belongs_to :user

  monetize :amount_cents

  validates :amount, numericality: {
    greater_than_or_equal_to: 0.01
  }
  validates :comment, length: {maximum: 80}
  validates :user, presence: true
  validates :date, presence: true
  validates :kind, presence: true, inclusion: {in: KIND_TYPES.map(&:to_s)}

  scope :last_ten, -> { order(id: :desc).limit(10) }
end
