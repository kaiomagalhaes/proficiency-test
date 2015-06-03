FactoryGirl.define do

  factory :student do
    name "User name test"
    register_number "13246587412"
    status 1

    factory :student_without_name do
      name nil
    end

    factory :student_without_register_number do
      register_number nil
    end

    factory :student_without_status do
      status nil
    end

  end

end
