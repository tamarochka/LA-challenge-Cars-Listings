require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :manufacturer do
    name 'Porsche'
    country 'Germany'
  end

  factory :car do
    # manufacturer_id 1
    color 'Red'
    year "2014"
    mileage 20
    description "car description"

  end


end
