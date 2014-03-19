FactoryGirl.define do
  factory :photographer do
    first_name 'John'
    last_name 'Doe'
    email 'example@example.com'
    password '12345678'
    password_confirmation '12345678'
  end
end

FactoryGirl.define do
  factory :admin_photographer do
    first_name 'John'
    last_name 'Doe'
    email 'example@example.com'
    password '12345678'
    password_confirmation '12345678'
    admin true
  end
end