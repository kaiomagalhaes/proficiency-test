require 'ffaker'

10.times do |index|
  Student.create! name: FFaker::Name.name, register_number: index.to_s
end
