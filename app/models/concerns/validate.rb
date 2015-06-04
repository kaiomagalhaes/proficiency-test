module Validate
  extend ActiveSupport::Concern
  included do
    validates :name, presence: true, length: {maximum: 45}
    validates :status, presence: true, inclusion: {in: [0, 1]}

    before_validation(:on => :create) do
      self.status ||= 0
    end
  end
end