class Snippet < ActiveRecord::Base
	validates :filename, presence: true
	validates :content, presence: true
	has_many :comments, dependent: :destroy
	belongs_to :user
end
