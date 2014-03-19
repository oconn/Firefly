FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name 'Doe'
    email 'example@example.com'
    password '12345678'
    password_confirmation '12345678'
  end
end