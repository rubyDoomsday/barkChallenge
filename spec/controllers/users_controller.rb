# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :request do
  let(:headers) { basic_auth_headers }

  context "Authorization" do
    let(:path) { users_new_url }

    it "requires valid token" do
      response = get path
      expect(response).to eq 200
    end
  end
end
