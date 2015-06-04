require 'rails_helper'

RSpec.describe Course, :type => :model do
  let(:course) do
    build(:course)
  end

  describe 'course is valid' do

    it 'When name and registration_number are defined' do
      expect(course).to be_valid
    end

    it 'When status is not defined' do
      expect(build(:course_without_status)).to be_valid
    end

    it 'When status is 0 or 1' do
      course.status = 0
      expect(course).to be_valid
      course.status = 1
      expect(course).to be_valid
    end

  end

  describe 'course is invalid' do

    it 'When name is not defined' do
      expect(build(:course_without_name)).to be_invalid
    end

    it 'When register_number is not defined' do
      expect(build(:course_without_description)).to be_invalid
    end

    it 'When status is not 0 or 1' do
      course.status = 5
      expect(course).to be_invalid
      course.status = 7
      expect(course).to be_invalid
    end

    it 'When register_number lenght is more than 45' do
      description_size_51 = 'Hi! I am a great description! Yeah! I am too long!'
      course.description = description_size_51
      expect(course).to be_invalid
    end

    it 'When name lenght is more than 45' do
      name_size_53 = 'Hi! I am a great name! Yeah! I am too long for this!'
      course.name = name_size_53
      expect(course).to be_invalid
    end

    it 'When already have a course with the same registration number' do
      course.save
      expect(build(:course)).to be_invalid
    end
  end
end
