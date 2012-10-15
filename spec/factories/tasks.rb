# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    userstory
    name "MyString"
    complete false
  end
end
