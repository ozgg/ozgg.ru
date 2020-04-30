# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  def default_url_options
    params.key?(:locale) ? { locale: I18n.locale } : {}
  end
end
