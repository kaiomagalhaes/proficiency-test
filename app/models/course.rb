class Course < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 45}
  validates :description, presence: true, uniqueness: true, length: {maximum: 45}
  validates :status, presence: true, inclusion: {in: [0, 1]}

  before_validation(:on => :create) do
    self.status ||= 0
  end

  has_many :students, through: :classrooms

end
