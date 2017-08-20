class User < ApplicationRecord
  has_secure_password

  has_many :auth_tokens, dependent: :destroy

  enum sex: [:male, :female]

  validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true
end