# frozen_string_literal: true

RSpec.describe 'Dog features' do
  let(:dog_client) { stub_client DogCeo::Client }
  let(:i18n_scope) { 'dogs.index' }
  let(:dog_ceo_response) { build(:dog) }

  it 'has correct title' do
    allow(dog_client).to receive(:breeds_show).and_return(dog_ceo_response)
    visit dogs_path

    expect_page_to_have_title(prefix: I18n.t('header', scope: i18n_scope))
  end

  it 'has correct form' do
    allow(dog_client).to receive(:breeds_show).and_return(dog_ceo_response)
    scope = 'common.actions'
    i8n_form = 'dogs.new_form_component'

    visit dogs_path

    expect(page).to have_field(I18n.t('label', scope: i8n_form))
    expect(page).to have_button(I18n.t('submit', scope:))
  end

  it 'renders the image' do
    allow(dog_client).to receive(:breeds_show).and_return(dog_ceo_response)
    breed = Faker::Creature::Dog.breed

    visit dogs_path
    fill_in 'breed', with: breed

    click_button 'Submit'

    # turbo-stream check
    expect(page).to have_css("turbo-frame[id='dog-image']")

    within('#dog-image') do
      expect(page).to have_css('img')
    end

    expect(page.find('.card-body')).to have_css('.img-fluid')
    expect(page).to have_content(breed)
  end

  it 'renders the error message' do
    scope = 'dogs.error_component'
    message = Faker::Lorem.sentence

    allow(dog_client).to receive(:breeds_show).and_raise(DogCeo::Error, message)

    visit dogs_path
    fill_in 'breed', with: Faker::Lorem.word

    click_button 'Submit'

    # turbo-stream check
    expect(page).to have_css("turbo-frame[id='dog-image']")

    # error in partial as turbo_stream
    within('#dog-image') do
      expect(page).to have_content(I18n.t('api_error', scope:, message:))
    end
  end
end
