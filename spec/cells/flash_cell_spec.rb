# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlashCell, type: :cell do
  describe '#flash_class' do
    flash_cell = FlashCell.new

    expected_values = {
      notice: 'alert alert-info',
      success: 'alert alert-success',
      error: 'alert alert-danger',
      alert: 'alert alert-danger'
    }

    expected_values.each do |type, css_class|
      it "returns '#{css_class}' when flash type is '#{type}'" do
        result = flash_cell.send(:flash_class, type)
        expect(result).to eq(css_class)
      end
    end
  end
end
