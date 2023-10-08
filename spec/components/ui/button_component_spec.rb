# frozen_string_literal: true

RSpec.describe Ui::ButtonComponent, type: :component do
  describe '#classes' do
    Ui::ButtonComponent::BUTTON_TYPE_MAPPINGS.each do |type, expected_class|
      it "returns '#{expected_class}' when type is #{type}" do
        component = described_class.new(type:)
        expect(component.classes).to eq(expected_class)
      end
    end
  end
end
