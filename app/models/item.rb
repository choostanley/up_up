class Item < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
	include PgSearch
  	pg_search_scope :search_by_name, :against => :name
end
