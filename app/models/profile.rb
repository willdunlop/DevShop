class Profile < ApplicationRecord
  belongs_to :user
  has_one :dev_corner
  has_many :contracts
  mount_uploader :image, ImagesUploader

  def self.search(search)
    where("first_name LIKE ?", "%#{search}%")

  end

end
