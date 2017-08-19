class User < ApplicationRecord
  has_secure_password

  enum sex: [:male, :female]

  validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true
end