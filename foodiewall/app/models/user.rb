class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :name, type: String
  field :password_digest, type: String
  field :is_active, type: Mongoid::Boolean, default: true

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_confirmation_of :password_digest
  validates_presence_of :password
  validates_length_of :name, minimum: 4, maximum: 11
  validates_length_of :password, minimum: 4, maximum: 11

  has_secure_password

  has_many :foodiepictures
end
