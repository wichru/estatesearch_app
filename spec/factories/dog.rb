# frozen_string_literal: true

FactoryBot.define do
  factory :dog, class: 'Dog' do
    initialize_with { new(attributes) }

    message { Faker::Internet.url }
    status { 'success' }

    trait :error do
      message { Faker::Lorem.sentence }
      status { 'error' }
    end
  end
end
