# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to have_db_column(:categorizable_id).of_type(:integer) }
  it { is_expected.to have_db_column(:categorizable_type).of_type(:string) }

  it { is_expected.to belong_to(:categorizable) }
end
