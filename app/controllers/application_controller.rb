# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&)
    locale = extract_locale_from_accept_language_header
    I18n.with_locale(locale, &)
  end

  private

  # определяем всегда ru
  # в рамках задач - достаточно
  def extract_locale_from_accept_language_header
    # if request.env['HTTP_ACCEPT_LANGUAGE']
    #   request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    # else
    # 'en'
    # end
    'ru'
  end
end
