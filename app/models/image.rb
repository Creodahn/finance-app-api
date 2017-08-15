class Image < ActiveRecord::Base
  validates :file_name, presence: true
  validates :url, presence: true, :url => true
  validates :uploader_id, presence: true

  belongs_to :uploader, :class_name => :Profile, :foreign_key => "uploader_id"
  belongs_to :imageable, polymorphic: true
end
