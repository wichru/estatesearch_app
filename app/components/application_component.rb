# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  include Turbo::StreamsHelper
  include Turbo::FramesHelper

  def self.i18n_scope = model_name.i18n_key.to_s.tr('/', '.')

  def initialize(**options)
    super()
    options.each do |key, value|
      self.class.attr_reader key
      instance_variable_set("@#{key}", value)
    end
  end
end
