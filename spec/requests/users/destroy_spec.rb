# frozen_string_literal: true

require 'rails_helper'

describe User, '#destroy' do
  let!(:user) { create(:user) }
  let!(:employee) { create(:user, :employees) }
  let!(:token) { user_token(user) }

  context 'when with valid id' do
    it 'destroy the user' do
      delete user_path(user.id), params: {}, headers: header_params(token:)
      expect(response).to have_http_status(:no_content)
    end
  end
end
