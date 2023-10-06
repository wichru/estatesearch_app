# frozen_string_literal: true

module Forms
  class SubmitComponent < ApplicationComponent
    def initialize(form:, title: I18n.t('common.actions.submit'), button_class: nil, disabled: false,
                   btn_type: :primary)
      super()
      @form = form
      @title = title
      @button_class = button_class
      @disabled = disabled
      @btn_type = btn_type
    end

    def call
      @form.submit @title, class: @button_class || ['px-10', Ui::ButtonComponent.new(type: @btn_type).classes],
                           disabled: @disabled
    end
  end
end
