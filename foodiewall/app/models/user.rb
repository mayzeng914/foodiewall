class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :name, type: String
  field :password_digest, type: String
  field :is_active, type: Mongoid::Boolean, default: true

  has_secure_password

  has_many :foodiepictures
end
