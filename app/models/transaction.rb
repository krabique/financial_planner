# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :user

  monetize :amount_cents

  validates :amount_cents, presence: true, numericality: {
    greater_than_or_equal_to: 0.01
  }
  validates :comment, length: {maximum: 80}
  validates :user, presence: true
  validates :date, presence: true

  scope :last_ten, -> { order(id: :desc).limit(10) }
end
