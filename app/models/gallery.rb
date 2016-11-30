class Gallery < ActiveRecord::Base
  
  belongs_to :event
  belongs_to :category
  mount_uploader :image, GalleryUploader

end
