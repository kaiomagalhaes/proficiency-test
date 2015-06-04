class Classroom < ActiveRecord::Base
  validates :student, presence: true
  validates :course, presence: true
  validate :cannot_duplicate_student_and_course


  belongs_to :student
  belongs_to :course

  def cannot_duplicate_student_and_course
    old_classroom = Classroom.find_by(student: student, course: course)
    if old_classroom
      errors.add(:student, "Student already on this course!")
    end
  end

  before_save(:on => :create) do
    self.entry_at = Time.now.utc
  end


end
