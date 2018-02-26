# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#flash_class' do
    it 'returns the appropriate flash class name' do
      expect(flash_class(:notice)).to eq 'alert alert-info'
      expect(flash_class(:success)).to eq 'alert alert-success'
      expect(flash_class(:error)).to eq 'alert alert-danger'
      expect(flash_class(:alert)).to eq 'alert alert-danger'
    end
  end
end
