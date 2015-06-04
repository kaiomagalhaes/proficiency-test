require 'ffaker'

5.times do |index|

  student = Student.create! name: FFaker::Name.name, register_number: index.to_s

  course = Course.create! name: FFaker::Name.name, description: FFaker::Lorem::phrase.slice(0..40)

  Classroom.create! student: student, course: course
end


