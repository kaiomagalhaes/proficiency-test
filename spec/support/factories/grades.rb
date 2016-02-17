FactoryGirl.define do
  factory :grade do
    value 1.5

    factory :grade_student_and_course do
      association :student, factory: :student
      association :course, factory: :course
    end

    factory :grade_without_student do
      association :course, factory: :course
    end

    factory :grade_without_course do
      association :student, factory: :student
    end
  end
end
