FactoryGirl.define do
  factory :classroom do
    factory :classroom_with_student_and_course do
      association :student, factory: :student
      association :course, factory: :course
    end

    factory :classroom_without_student do
      association :course, factory: :course
    end

    factory :classroom_without_course do
      association :student, factory: :student
    end
  end
end
