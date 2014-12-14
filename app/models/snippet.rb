class Snippet < ActiveRecord::Base
	validates :filename, presence: true
	validates :content, presence: true
end
