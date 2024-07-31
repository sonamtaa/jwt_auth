# frozen_string_literal: true

require 'rails_helper'

describe 'User logout', type: :request do
  let!(:admin) { create(:role) }
  let!(:user) { create(:user, role_id: admin.id) }
  let!(:token) { user_token(user) }

  it 'revokes the token' do
    delete '/auth/logout', headers: header_params(token:)
    expect(response).to have_http_status(:no_content)
  end
end
