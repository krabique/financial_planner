# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateCategoryService, type: :service do
  let(:user) { create(:user) }

  describe '#call' do
    context 'when creating a first level category' do
      subject do
        described_class.new(
          parent: user,
          params: {name: 'abc', user: user}
        )
      end

      it 'creates a first level category for the user' do
        expect(subject.call).to eq user.categories.last
      end
    end

    context 'when creating a nested category' do
      subject do
        described_class.new(
          parent: create(
            :category, user: user, name: 'abc', categorizable: user
          ),
          params: {name: 'def', user: user}
        )
      end

      it 'creates a first level category for the user' do
        expect(subject.call).to eq user.categories.last
      end
    end
  end
end
