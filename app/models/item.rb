class Item < ActiveRecord::Base
	belongs_to :user
	validates :title, length: { minimum: 2 }, uniqueness: true, presence: true
	validates :description, length: { maximum: 50}
end
