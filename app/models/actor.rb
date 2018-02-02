# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  name       :string
#  dob        :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Actor < ApplicationRecord
	has_and_belongs_to_many :movies
	validates :name, presence: true 
	validates :dob, presence: true
end
