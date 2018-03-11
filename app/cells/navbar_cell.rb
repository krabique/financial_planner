# frozen_string_literal: true

# The navbar cell
class NavbarCell < ApplicationCell
  def show
    @balance = Transaction.where(user: current_user).sum(:amount_cents)
      .to_money / 100
    render
  end

  private

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

  def current_user_link(path)
    @path = path
    render
  end
end
