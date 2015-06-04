require 'rails_helper'

RSpec.describe Student, :type => :model do

  let(:student) do
    build(:student)
  end

  describe 'Student is valid' do

    it 'is valid when name and registration_number are defined' do
      expect(student).to be_valid
    end

    it 'is valid when status is not defined' do
      expect(build(:student_without_status)).to be_valid
    end

    it 'is valid when status is 0 or 1' do
      student.status = 0
      expect(student).to be_valid
      student.status = 1
      expect(student).to be_valid
    end

  end

  describe 'Student is invalid' do

    it 'is invalid when name is not defined' do
      expect(build(:student_without_name)).to be_invalid
    end

    it 'is invalid when register_number is not defined' do
      expect(build(:student_without_register_number)).to be_invalid
    end

    it 'is invalid when status is not 0 or 1' do
      student.status = 5
      expect(student).to be_invalid
      student.status = 7
      expect(student).to be_invalid
    end

    it 'is invalid when register_number lenght is more than 45' do
      registration_number_size_46 = '1111111111111111111111111111111111111111111111'
      student.register_number = registration_number_size_46
      expect(student).to be_invalid
    end

    it 'is invalid when name lenght is more than 45' do
      name_size_53 = 'Hi! I am a great name! Yeah! I am too long for this!'
      student.name = name_size_53
      expect(student).to be_invalid
    end

    it 'is invalid when already have a student with the same registration number' do
      student.save
      expect(build(:student)).to be_invalid
    end

  end
end
