# frozen_string_literal: true

module TestHelpers
  module CoreHelper
    def expect_page_to_have_title(prefix: nil, with_prefix: false)
      app_name = Rails.application.config.app_name
      title_text = with_prefix ? "#{prefix} - #{app_name}" : app_name
      expect(page).to have_title title_text
    end
  end
end
