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
    it 'creates default categories for the given user' do
      subject.call
      expect(Category.count).to eq 6

      DEFAULT_CATEGORIES.reverse.each_with_index do |category, index|
        expect(user.categories[index].name).to eq category
      end
    end
  end
end
