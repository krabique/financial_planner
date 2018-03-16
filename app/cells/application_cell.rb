# frozen_string_literal: true

# A cell with common included modules, is a parent class for most other cells
class ApplicationCell < Cell::ViewModel
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::FormOptionsHelper
  include SimpleForm::ActionViewExtensions::FormHelper
  include SimpleForm::Inputs
  include Devise::Controllers::Helpers

  # This is required for icons to render properly.
  #
  # Example:
  #
  # i.fa.fa-google[aria-hidden="true"]
  # #=> <i aria-hidden="true" class="fa fa-google"></i>
  # # (returns as an escaped html text, instead of the actual icon)
  #
  # https://github.com/trailblazer/cells-slim/issues/14
  def tag_builder
    super.tap { |builder| builder.class_eval { include Cell::Slim::Rails } }
  end
end
