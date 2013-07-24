FactoryGirl.define do
  factory :repo do
    sequence(:name) { |n| "repo ##{n}" }
    schema      { { id: 'The ID of the text', text: 'the data of the record'}.to_json }
    description "Data about stuff"
    public      true
  end

  factory :user do
    sequence(:username) { |n| "username#{n}" }
    sequence(:email)   { |n| "example_#{n}@example.com" }
    password  "foobar"
    password_confirmation "foobar"
    sequence(:first_name) { |n| "John#{n}" }
    sequence(:last_name) { |n| "Doe#{n}" }
    about "Best John Doe there ever was"
  end

  factory :data_source do
    source File.new(Rails.root + "spec/test-db.csv")
    rows 128
  end
end
