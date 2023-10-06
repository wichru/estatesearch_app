# frozen_string_literal: true

module PageTitleHelper
  def content_for_title(title = nil) = content_for(:title, *[title].compact)
end
