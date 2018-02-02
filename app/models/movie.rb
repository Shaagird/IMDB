class Movie < ApplicationRecord
	has_and_belongs_to_many :actors
	validates :name, presence: true
	validates :release_date, presence: true
	validates :description, presence:true
end
