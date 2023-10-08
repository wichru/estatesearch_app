# frozen_string_literal: true

class DogsController < ApplicationController
  def index; end

  def fetch_image
    response = fetch_url

    render turbo_stream: turbo_stream.replace('dog-image', partial: 'image',
                                                           locals: { url: response.message, breed: sanitized_breed })
  rescue DogCeo::Error => e
    render turbo_stream: turbo_stream.replace('dog-image', partial: 'errors', locals: { message: e.message })
  end

  private

  def fetch_url = client.breeds_show(sanitized_breed)

  def client = @client ||= DogCeo::Client.new
  def sanitized_breed = @sanitized_breed ||= params[:breed].downcase
end
