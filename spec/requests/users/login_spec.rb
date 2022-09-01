# frozen_string_literal: true

require 'rails_helper'

describe 'User login' do
  let!(:user) { create(:user) }
  let!(:image) { fixture_file_upload(Rails.root.join('spec', 'files', 'ttpl.png')) }
  let!(:profile) { user.reload.profile }

  context 'with valid email' do
    it 'renders user token' do
      post user_session_path, params: { user: { email: user.email, password: user.password } }, headers: {}
      expect(status).to eq(200)
      expect(response.header['Authorization'].present?).to be(true)
      expect(json.dig(:user, :profile_attributes, :image_url)).to eq(Faker::LoremPixel.image)
    end
  end

  context 'with invalid email' do
    it 'throws invalid login error' do
      post user_session_path, params: { user: { email: 'invalid-email@gmail.com', password: user.password } },
                              headers: {}
      expect(status).to eq(401)
      expect(json[:error]).to eq('Invalid Email or password.')
    end
  end
end
