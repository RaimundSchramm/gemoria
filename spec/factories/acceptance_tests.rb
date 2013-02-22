# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :acceptance_test do
    userstory
    description "MyText"
    complete false
  end
end
