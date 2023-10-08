# frozen_string_literal: true

module PageTitleHelper
  def application_title = [content_for_title, Rails.application.config.app_name].compact.join(' - ')
  def content_for_title(title = nil) = content_for(:title, *[title].compact)
  def render_page_header = content_tag(:h2, t('.header'), class: 'mt-4 mb-5 text-primary')
end
