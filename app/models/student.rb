class Student < ActiveRecord::Base
  include Validate

  validates :register_number, presence: true, uniqueness: true, length: {maximum: 45}
  has_many :courses, through: :classrooms

end
