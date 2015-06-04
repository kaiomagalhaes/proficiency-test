require 'ffaker'

10.times do |index|
  Student.create! name: FFaker::Name.name, register_number: index.to_s
end

5.times do |index|
  Course.create! name: FFaker::Name.name, description: FFaker::Lorem::phrase.slice(0..40)
end

