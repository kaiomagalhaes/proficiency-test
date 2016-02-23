# Serve as model for Course entity
class Course < ActiveRecord::Base
  include Validate

  validates :description, presence: true, length: { maximum: 45 }
  has_many :students, through: :classrooms

  def destroy
    class_room = Classroom.find_by(course: self)
    if class_room
      errors.add(:course,
                 'Course alread in a classroom! Delete the classroom before!')
      return false
    end
    super
  end
end
