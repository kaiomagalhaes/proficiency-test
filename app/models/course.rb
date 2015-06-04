class Course < ActiveRecord::Base
  include Validate

  validates :description, presence: true, length: {maximum: 45}
  has_many :students, through: :classrooms

end
