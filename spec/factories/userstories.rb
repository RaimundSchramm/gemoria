# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :userstory do
    project
    name "MyString"
    description "MyString"

    factory :userstory_sprint do
      after(:create) do |userstory|
        userstory.position = 'sprint'
        userstory.save
      end
    end

    factory :userstory_accepted do
      after(:create) do |userstory|
        userstory.status = 'accepted'
        userstory.save
      end
    end

    factory :userstory_sprint_accepted do
      after(:create) do |userstory|
        userstory.position = 'sprint'
        userstory.status   = 'accepted'
        userstory.save
      end
    end
  end
end
