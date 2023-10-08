# frozen_string_literal: true

RSpec.describe DogsController do
  render_views

  describe 'GET #fetch_image' do
    let(:dog_client) { stub_client DogCeo::Client }
    let(:dog_ceo_response) { build(:dog) }
    let(:breed) { Faker::Creature::Dog.breed }

    context 'when fetch succeeds' do
      before do
        allow(dog_client).to receive(:breeds_show).and_return(dog_ceo_response)
      end

      it 'returns turbo_stream content type' do
        get :fetch_image, params: { breed: }, as: :turbo_stream

        expect(response.media_type).to eq Mime[:turbo_stream]
        expect(response.body).to include(dog_ceo_response.message)
      end
    end

    context 'when fetch fails' do
      let(:message) { Faker::Lorem.sentence }

      before do
        allow(dog_client).to receive(:breeds_show).and_raise(DogCeo::Error, message)
      end

      it 'returns turbo_stream content type with an error message' do
        get :fetch_image, params: { breed: }, as: :turbo_stream

        expect(response.media_type).to eq Mime[:turbo_stream]
        expect(response.body).to include(I18n.t('api_error', scope: 'dogs.error_component', message:))
      end
    end
  end
end
