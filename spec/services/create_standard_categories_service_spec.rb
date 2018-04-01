# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateStandardCategoriesService, type: :service do
  DEFAULT_CATEGORIES =
    %w[Transportation Food House Entertainment Health Other].freeze

  subject { described_class.new(user: user) }

  let(:user) { create(:user) }

  describe '#initialize' do
    it 'assigns parameters' do
      expect(subject.instance_variable_get(:@user)).to eq user
    end
  end

  describe '#call' do
    let(:user_categories) { user.categories.pluck(:name) }

    it 'creates default categories for the given user' do
      subject.call
      expect(user.categories.count).to eq 6
      expect(user_categories).to match_array(DEFAULT_CATEGORIES)
    end
  end
end
