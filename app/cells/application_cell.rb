class ApplicationCell < Cell::ViewModel
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::FormOptionsHelper
  include SimpleForm::ActionViewExtensions::FormHelper
  include SimpleForm::Inputs
  include Devise::Controllers::Helpers
end
