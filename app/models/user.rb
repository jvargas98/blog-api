class User < ApplicationRecord
  has_many :posts
  validates :email, :name, :auth_token, presence: true

  after_initialize :generate_auth_token

  def generate_auth_token
    unless auth_token.present?
      self.auth_token = TokenGenerationService.generate
    end
  end
end
