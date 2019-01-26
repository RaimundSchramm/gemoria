FactoryBot.define do
  factory :acceptance_test do
    userstory
    description { "MyText" }
    complete    { false }
  end
end
