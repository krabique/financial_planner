# frozen_string_literal: true

# This cell is used for transactions
class TransactionsCell < Cell::ViewModel
  include ActionView::RecordIdentifier
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::FormOptionsHelper
  include SimpleForm::ActionViewExtensions::FormHelper
  include SimpleForm::Inputs
  include Devise::Controllers::Helpers

  def new(transaction)
    @transaction = transaction
    render
  end
end
