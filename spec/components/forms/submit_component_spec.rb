# frozen_string_literal: true

RSpec.describe Forms::SubmitComponent, type: :component do
  let(:form) { instance_double(ActionView::Helpers::FormBuilder) }
  let(:default_title) { I18n.t('common.actions.submit') }
  let(:custom_title) { 'Custom Submit' }
  let(:default_px_class) { 'px-10' }
  let(:default_button_classes) { 'btn btn-primary' }

  before do
    allow(form).to receive(:submit)
  end

  def expect_submit_with(**options)
    expect(form).to have_received(:submit).with(
      options[:title],
      hash_including(
        class: array_including(default_px_class, options[:class]),
        disabled: options[:disabled]
      )
    )
  end

  it 'renders with default classes' do
    render_inline(described_class.new(form:))
    expect_submit_with(title: default_title, class: default_button_classes, disabled: false)
  end

  it 'renders the submit button with custom title' do
    render_inline(described_class.new(form:, title: custom_title))
    expect_submit_with(title: custom_title, class: default_button_classes, disabled: false)
  end

  it 'renders with disabled' do
    render_inline(described_class.new(form:, disabled: true))
    expect_submit_with(title: default_title, class: default_button_classes, disabled: true)
  end

  it 'renders with a custom button type' do
    custom_button_classes = 'btn btn-secondary'
    render_inline(described_class.new(form:, btn_type: :secondary))
    expect_submit_with(title: default_title, class: custom_button_classes, disabled: false)
  end
end
