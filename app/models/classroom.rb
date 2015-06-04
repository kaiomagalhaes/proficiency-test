class Classroom < ActiveRecord::Base
  validates :student, presence: true
  validates :course, presence: true

  belongs_to :student
  belongs_to :course

  before_save(:on => :create) do
    self.entry_at = Time.now.utc
  end

end
