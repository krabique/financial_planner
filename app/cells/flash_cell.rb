# frozen_string_literal: true

# The flash messages cell
class FlashCell < Cell::ViewModel
  def show
    flash
    render
  end

  def flash
    @flash ||= parent_controller.flash
  end

  private

  def flash_class(type)
    case type
    when :notice then 'alert alert-info'
    when :success then 'alert alert-success'
    when :error then 'alert alert-danger'
    when :alert then 'alert alert-danger'
    end
  end
end
