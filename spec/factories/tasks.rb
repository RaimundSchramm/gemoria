FactoryBot.define do
  factory :task do
    userstory
    name      { "MyString" }
    complete  { false }
  end
end
