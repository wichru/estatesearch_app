# frozen_string_literal: true

module Dogs
  class ErrorComponent < ApplicationComponent
    def error_message = I18n.t('dogs.error_component.api_error', message:)
  end
end
