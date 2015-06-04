class Classroom < ActiveRecord::Base

  attr_accessor :student
  attr_accessor :course
  attr_accessor :course

  validates :student, presence: true
  validates :course, presence: true

  belongs_to :student
  belongs_to :course

  before_save(:on => :create) do
    self.entry_at = Time.now.utc
  end

end
