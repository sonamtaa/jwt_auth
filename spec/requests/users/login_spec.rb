# frozen_string_literal: true

require 'rails_helper'

describe 'User login' do
  let!(:admin) { create(:role) }
  let!(:user) { create(:user) }

  context 'with valid email' do
    it 'renders user token' do
      post '/auth/login', params: { user: { email: user.email, password: user.password } }, headers: {}
      expect(status).to eq(200)
      expect(json['token'].present?).to be(true)
      expect(json['username']).to eq(user.username)
    end
  end

  context 'with invalid email' do
    it 'throws invalid login error' do
      post '/auth/login', params: { user: { email: 'invalid-email@gmail.com', password: user.password } }, headers: {}
      expect(status).to eq(401)
      expect(json[:error]).to eq('Invalid Email or Password')
    end
  end
end
