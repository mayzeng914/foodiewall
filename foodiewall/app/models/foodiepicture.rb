class Foodiepicture
  include Mongoid::Document
  include Mongoid::Paperclip 
  field :description, type: String
  attr_accessor :user
  #field :picture_url, type: String

  belongs_to :user

  has_mongoid_attached_file :image
  # ,styles: {
  #   thumb: '100x100>',
  #   square: '200x200#',
  #   medium: '300x300>'
  # }
  validates_attachment_content_type :image, content_type:["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
