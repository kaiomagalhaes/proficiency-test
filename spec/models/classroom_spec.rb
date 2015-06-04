require 'rails_helper'

RSpec.describe Classroom, :type => :model do

  describe 'classroom is valid' do

    let(:classroom) do
      build(:classroom_with_student_and_course)
    end

    it 'When have a course and a student associated with him' do
      expect(classroom).to be_valid
    end

    it 'When created the field entry_at is filled with Time.now.utc' do
      classroom.save!
      expect(classroom.entry_at.to_s).to eql(Time.now.utc.to_s)
    end

    it 'When created the field entry_at is filled with Time.now.utc even if was alread defined' do
      classroom.entry_at = Time.utc(2008, 7, 8, 9, 10, 11)
      classroom.save!
      expect(classroom.entry_at.to_s).to eql(Time.now.utc.to_s)
    end

  end

  describe 'classroom is invalid' do

    it "When have doesn't have a course and a student associated with him" do
      expect(build(:classroom)).to be_invalid
    end

    it "When have doesn't have a course associated with him" do
      expect(build(:classroom_without_course)).to be_invalid
    end

    it "When have doesn't have a student associated with him" do
      expect(build(:classroom_without_student)).to be_invalid
    end

  end

end
