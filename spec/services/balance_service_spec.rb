# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BalanceService, type: :service do
  subject { described_class.new(user) }

  let(:user) { create(:user) }

  describe '#initialize' do
    it 'assigns parameters' do
      expect(subject.instance_variable_get(:@user)).to eq user
    end
  end

  describe '#balance' do
    it "returns user's balance" do
      balance = Transaction.where(user: user).sum(:amount_cents)
        .to_money / 100
      expect(subject.balance).to eq balance
    end
  end
end
