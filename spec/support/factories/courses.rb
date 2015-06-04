FactoryGirl.define do
  factory :course do
    name "Course name test"
    description "This is a legal course name"
    status 1

    factory :course_without_name do
      name nil
    end

    factory :course_without_description do
      description nil
    end

    factory :course_without_status do
      status nil
    end
  end

end
