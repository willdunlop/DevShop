class Profile < ApplicationRecord
  belongs_to :user
  has_one :dev_corner
  mount_uploader :image, ImagesUploader
end
