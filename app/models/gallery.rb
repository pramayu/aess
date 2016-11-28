class Gallery < ActiveRecord::Base
  
  belongs_to :event
  mount_uploader :image, GalleryUploader

end
