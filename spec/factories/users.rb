# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'MyString'
    password 'secret'
    password_confirmation 'secret'
    admin false

    factory :mund do
      name 'mund'
    end

    factory :mirk do
      name 'mirk'
    end

    factory :admin do
      admin true
    end

    factory :non_admin do
    end
  end
end
