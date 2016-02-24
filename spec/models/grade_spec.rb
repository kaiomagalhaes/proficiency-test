require 'rails_helper'

RSpec.describe Grade, type: :model do
  describe 'grade is valid' do
    let(:grade) do
      build(:grade)
    end

    it 'has value, course and student' do
      expect(build(:grade_student_and_course)).to be_valid
    end
  end

  describe 'grade is not valid' do
    it 'has value, course and student' do
      expect(build(:grade_without_student)).to be_invalid
    end

    it 'has value, course and student' do
      expect(build(:grade_without_course)).to be_invalid
    end
  end
end
