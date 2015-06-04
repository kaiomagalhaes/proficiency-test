class Student < ActiveRecord::Base
  include Validate

  validates :register_number, presence: true, uniqueness: true, length: {maximum: 45}
  has_many :courses, through: :classrooms

  def destroy
    class_room = Classroom.find_by(student: self)
    if class_room
      errors.add(:student, "Student alread in a classroom! Delete the classroom before!")
      return false
    end
    super
  end
end
