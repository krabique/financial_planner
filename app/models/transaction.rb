# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :user

  monetize :amount_cents

  validates :amount_cents, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }
  validates :kind, presence: true, inclusion: {
    in: %w[income expense],
    message: "Transaction's kind must be either income or expense"
  }
  validates :comment, presence: true, length: {maximum: 80}
  validates :user, presence: true
  validates :date, presence: true
end
