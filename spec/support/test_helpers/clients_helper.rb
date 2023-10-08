# frozen_string_literal: true

module TestHelpers
  module ClientsHelper
    def stub_client(client_class)
      client = instance_double(client_class)
      allow(client_class).to receive(:new).and_return(client)
      client
    end
  end
end
