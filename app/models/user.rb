class User < ApplicationRecord
  has_secure_password

  has_many :auth_tokens, dependent: :destroy

  has_attached_file :avatar, styles: { thumn: "300x300#" } #, default_url: "/images/:style/missing.png"

  enum sex: [:male, :female]

  validates :email, presence: true, uniqueness: { case_sensitive: false }, email: true

  validates_attachemnt_content_type :avatar, content_type: /\.(png|jpg|jpeg|gif)$/
end