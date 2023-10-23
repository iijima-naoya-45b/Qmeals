class WisdomPhoto < ApplicationRecord
  mount_uploader :image, WisdomImageUploader
end
