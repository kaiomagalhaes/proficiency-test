class Student < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 45}
  validates :register_number, presence: true, uniqueness: true, length: {maximum: 45}
  validates :status, presence: true, inclusion: {in: [0, 1]}

  before_validation(:on => :create) do
    self.status ||= 0
  end
end
