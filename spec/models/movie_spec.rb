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
require 'rails_helper'

RSpec.describe Movie do
	context 'Date Validations' do
   it 'should return true if release_date is not earlier than 1913 and not greater than today' do
      movie = FactoryBot.create(:movie, :release_date => Date.today - 20)
      result = movie.validate_date
      expect(result).to eq(true)
      end

     it  'should return false if release_date is greater than today' do
     	movie = FactoryBot.create(:movie, :release_date => Date.today + 5)
     	result = movie.validate_date
     	expect(result).to eq(false)
     end

     it 'should return false if the release_date is earlier than 1913' do
     	movie = FactoryBot.create(:movie, :release_date => Date.today - (365 * 105))
     	result = movie.validate_date_if_earlier
     	expect(result).to eq(false)
     end
   end

   context 'Rating' do
     it 'should return true if rating is in between 0 and 5 both inclusive' do 
     	movie = FactoryBot.create(:movie, :rating => '4')
     	result = movie.validate_rating
     	expect(result).to eq(true)
     end

     it 'should return false if rating is outside the range 0 to 5' do
       movie = FactoryBot.create(:movie, :rating=> '6')
       result = movie.validate_rating
       expect(result).to eq(false) 
     end

     it 'sample test' do
     movie = FactoryBot.create(:movie) 
     expect(movie.valid?).to eq(true)
     end

   end


end