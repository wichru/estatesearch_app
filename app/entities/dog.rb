# frozen_string_literal: true

class Dog < ApplicationEntity
  attribute :message, Types::String
  attribute :status, Types::String

  def success? = status == 'success'
end
