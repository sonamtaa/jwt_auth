# frozen_string_literal: true

require 'rails_helper'

describe 'User logout', type: :request do
  let!(:admin) { create(:role) }
  let!(:user) { create(:user) }
  let!(:token) { user_token(user) }

  it 'revokes the token' do
    delete destroy_user_session_path
    expect(response).to have_http_status(:no_content)
  end
end
