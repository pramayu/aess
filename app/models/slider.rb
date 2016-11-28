class Slider < ActiveRecord::Base
  mount_uploader :slider, SliderUploader
end
