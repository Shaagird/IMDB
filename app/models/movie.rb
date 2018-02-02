# == Schema Information
#
# Table name: movies
#
#  id           :integer          not null, primary key
#  name         :string
#  release_date :datetime
#  description  :string
#  rating       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Movie < ApplicationRecord
	has_and_belongs_to_many :actors
	validates :name, presence: true
	validates :release_date, presence: true
	validates :description, presence:true


	def validate_date
		release_date <= Date.today
	end

	def validate_date_if_earlier
		release_date > Date.today - (365 * 105)
	end

	def validate_rating
		rating >= 0 && rating <= 5
	end

end
