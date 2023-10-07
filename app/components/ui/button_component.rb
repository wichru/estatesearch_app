module Ui
  class ButtonComponent < ApplicationComponent
    attr_reader :type

    BUTTON_TYPE_MAPPINGS = {
      primary: 'btn btn-primary',
      secondary: 'btn btn-secondary',
      success: 'btn btn-success',
      danger: 'btn btn-danger',
      neutral: 'btn btn-light'
    }.freeze

    def initialize(type: :primary)
      super()
      @type = type
    end

    def classes
      BUTTON_TYPE_MAPPINGS[@type]
    end
  end
end
