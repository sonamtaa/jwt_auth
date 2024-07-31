# frozen_string_literal: true

class JwtBlacklist < ApplicationRecord
  validates :jti, presence: true
end
