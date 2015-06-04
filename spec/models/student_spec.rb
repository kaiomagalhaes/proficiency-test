require 'rails_helper'

RSpec.describe Student, :type => :model do

  let(:student) do
    build(:student)
  end

  describe 'Student is valid' do

    it 'When name and registration_number are defined' do
      expect(student).to be_valid
    end

    it 'When status is not defined' do
      expect(build(:student_without_status)).to be_valid
    end

    it 'When status is 0 or 1' do
      student.status = 0
      expect(student).to be_valid
      student.status = 1
      expect(student).to be_valid
    end

  end

  describe 'Student is invalid' do

    it 'When name is not defined' do
      expect(build(:student_without_name)).to be_invalid
    end

    it 'When register_number is not defined' do
      expect(build(:student_without_register_number)).to be_invalid
    end

    it 'When status is not 0 or 1' do
      student.status = 5
      expect(student).to be_invalid
      student.status = 7
      expect(student).to be_invalid
    end

    it 'When register_number lenght is more than 45' do
      registration_number_size_46 = '1' * 46
      student.register_number = registration_number_size_46
      expect(student).to be_invalid
    end

    it 'When name lenght is more than 45' do
      name_size_53 = 'Hi! I am a great name! Yeah! I am too long for this!'
      student.name = name_size_53
      expect(student).to be_invalid
    end

    it 'When already have a student with the same registration number' do
      student.save
      expect(Student.new(student.attributes)).to be_invalid
    end

  end

  describe 'Is valid destroy student' do
    it 'When is not associated with a Classroom' do
      student.save
      expect { student.destroy }.to change(Student, :count).by(-1)
    end
  end

  describe 'Is invalid destroy student' do
    it 'When already associated with a Classroom' do
      student.save
      create(:classroom, student: student, course: create(:course))
      expect { student.destroy }.to change(Student, :count).by(0)
    end
  end
end
