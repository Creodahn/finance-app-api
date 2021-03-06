class Api::ImageResource < Api::BaseResource
  attribute :file_name
  attribute :url
  attribute :description

  has_one :imageable, polymorphic: true
  has_one :uploader

  filter :file_name
  filter :profile
  filter :url
end
