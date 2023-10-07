# frozen_string_literal: true

module Forms
  class BaseFieldComponent < ApplicationComponent
    FIELD_CLASSES = 'form-control-lg rounded mb-3'
    LABEL_CLASSES = 'form-label mb-3 d-block small font-weight-medium mb-1'

    # rubocop:disable Metrics/ParameterLists
    def initialize(form:, autofocus: nil, field: default_field, id: nil, label: nil, name: nil, required: nil, **root_options)
      super(**root_options)
      @form = form
      @field = field
      @id = id || "#{field}-#{SecureRandom.alphanumeric(10)}"
      @label = label
      @required = required
      @custom_field_options = {
        autofocus:,
        id: @id,
        required: ('required' if required)
      }
      @custom_label_options = {
        for: @id,
        name:,
      }.compact
    end
    # rubocop:enable Metrics/ParameterLists

    def default_field_options
      {
        class: FIELD_CLASSES
      }
    end

    def default_label_options
      entity = { class: LABEL_CLASSES }
      entity[:class] += ' required' if @required
      entity
    end

    def field_options
      default_field_options.merge(@custom_field_options)
    end

    def label_options
      default_label_options.merge(@custom_label_options)
    end

    private

    attr_reader :form, :field, :label
  end
end
