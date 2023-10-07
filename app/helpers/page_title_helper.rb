# frozen_string_literal: true

module PageTitleHelper
  def application_title = [content_for_title, Rails.application.config.app_name].compact.join(' - ')
  def content_for_title(title = nil) = content_for(:title, *[title].compact)
end
