class Region < ActiveRecord::Base

  belongs_to :country

  has_many :cities, dependent: :destroy
end
