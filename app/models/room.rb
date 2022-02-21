class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  
  mount_uploader :image, ImageUploader
  
  validates :title, presence: true
  validates :introduction, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: true
end
