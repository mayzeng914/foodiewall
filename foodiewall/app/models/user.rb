class User
  include Mongoid::Document
  include Mongoid::Paperclip 
  include ActiveModel::SecurePassword
  field :name, type: String
  field :password_digest, type: String
  field :is_active, type: Mongoid::Boolean, default: true

  # validates :name, presence: {message: "you need an username!"},
  #  uniqueness: {message: "think of something unique!"},
  #  length: { in 4..11 }
  #  format: { with: /\A[a-zA-Z]+\z/, message: "letters only!" }
  # validates :password, presence: {message: "you need a password!"},
  #  length: { in 4..11 }
  # validates :image, presence: {message: "you need an avatar!"}

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_confirmation_of :password
  validates_presence_of :password
  validates_length_of :name, minimum: 4, maximum: 11
  validates_length_of :password, minimum: 4, maximum: 11
  validates_presence_of :image

  has_secure_password

  has_many :foodiepictures

  has_mongoid_attached_file :image
  validates_attachment_content_type :image, content_type:["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
