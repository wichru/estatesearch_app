# frozen_string_literal: true

RSpec.describe DogCeo::Client do
  subject(:client) { described_class.new }

  def build_url(path) = "#{Rails.configuration.dog_ceo.api_url}#{path}"

  describe '#breeds_show' do
    let(:breed) { Faker::Creature::Dog.breed.tr(' ', '_') }
    let(:response_entity) { build(:dog) }
    let(:body) { { 'message' => response_entity.message, status: response_entity.status }.to_json }

    def stub_breeds_show = stub_request(:get, build_url("breed/#{breed}/images/random"))

    context 'when the request is successful' do
      let(:status) { 200 }

      before { stub_breeds_show.to_return(status:, body:) }

      it 'returns a Dog' do
        expect(client.breeds_show(breed)).to be_a(Dog)
      end

      it 'returns a Dog with the correct url' do
        expect(client.breeds_show(breed).message).to eq(response_entity.message)
      end
    end

    context 'when the request is unsuccessful' do
      let(:response_entity) { build(:dog, :error) }
      let(:status) { 404 }

      before { stub_breeds_show.to_return(status:, body:) }

      it 'handles failed status' do
        expect { client.breeds_show(breed) }.to raise_error(DogCeo::Error)
      end
    end
  end
end
