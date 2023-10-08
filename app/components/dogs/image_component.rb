# frozen_string_literal: true

module Dogs
  class ImageComponent < ApplicationComponent
    def footer_text = I18n.t('dogs.image_component.footer', breed: titleized_name)
    def titleized_name = breed.titleize
  end
end
