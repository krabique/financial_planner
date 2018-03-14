# frozen_string_literal: true

# This module is used to fake a url for a previous page in order to test
# the redirect_back controller method
module RedirectBack
  def from(url)
    request.env['HTTP_REFERER'] = url
  end
end
