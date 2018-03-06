# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'validations' do
    it { should validate_presence_of :amount_cents }
    it {
      should validate_numericality_of(:amount_cents)
        .is_greater_than_or_equal_to(0)
    }
    it { should validate_presence_of :kind }
    it { should validate_inclusion_of(:kind).in_array(%w[income expense]) }
    it { should validate_presence_of :comment }
    it { should validate_length_of(:comment).is_at_most(80) }
    it { should validate_presence_of :user }
    it { should validate_presence_of :date }
  end

  context 'associations' do
    it { should belong_to(:user) }
  end
end
