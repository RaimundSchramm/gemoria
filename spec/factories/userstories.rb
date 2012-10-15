# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :userstory do
    project
    name "MyString"
    description "MyString"
  end
end
