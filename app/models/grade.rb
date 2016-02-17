class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :course

  validates :student, presence: true
  validates :course, presence: true
end
