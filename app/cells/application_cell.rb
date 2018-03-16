# frozen_string_literal: true

# A cell with common included modules, is a parent class for most other cells
class ApplicationCell < Cell::ViewModel
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::FormOptionsHelper
  include SimpleForm::ActionViewExtensions::FormHelper
  include SimpleForm::Inputs
  include Devise::Controllers::Helpers
end
