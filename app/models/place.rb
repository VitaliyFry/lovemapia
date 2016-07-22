class Place < ActiveRecord::Base

  belongs_to :category
  belongs_to :city

  has_many :reviews

  geocoded_by :address   # can also be an IP address
  after_validation :geocode

  has_attached_file :image1, styles: { small: "100x100", medium: "250x250>", large: "400x400", full: "100%" }, default_url: "places/missing.png"
  validates_attachment_content_type :image1, content_type: /\Aimage\/.*\Z/

  has_attached_file :image2, styles: { small: "100x100", medium: "250x250>", large: "400x400", full: "100%" }, default_url: "places/missing.png"
  validates_attachment_content_type :image2, content_type: /\Aimage\/.*\Z/

  has_attached_file :image3, styles: { small: "100x100", medium: "250x250>", large: "400x400", full: "100%" }, default_url: "places/missing.png"
  validates_attachment_content_type :image3, content_type: /\Aimage\/.*\Z/

  validates :title, :address, presence: true
end
