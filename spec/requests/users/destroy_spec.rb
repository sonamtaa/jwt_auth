# frozen_string_literal: true

require 'rails_helper'

describe User, '#destroy' do
  let!(:user) { create(:user) }
  let!(:employee) { create(:employee) }
  let!(:token) { user_token(user) }

  context 'when with valid id' do
    it 'destroy the user' do
      delete api_v1_auth_user_path(employee), params: {}, headers: header_params(token:)
      expect(response).to have_http_status(:no_content)
    end
  end
end
