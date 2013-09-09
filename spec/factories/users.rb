# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'MyString'
    password 'secret'
    password_confirmation 'secret'

    factory :mund do
      name 'mund'
    end

    factory :mirk do
      name 'mirk'
    end
  end
end
