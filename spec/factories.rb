FactoryGirl.define do
  factory :repo do
    sequence(:name) { |n| "repo ##{n}" }
    schema      { { id: 'The ID of the text', text: 'the data of the record'}.to_json }
    description "Data about stuff"
    num_rows    200
    size        23403
    public      true
  end

  factory :user do
    sequence(:email)   { |n| "example_#{n}@example.com" }
    password  "foobar"
    password_confirmation "foobar"
    sequence(:first_name) { |n| "John#{n}" }
    sequence(:last_name) { |n| "Doe#{n}" }
    about "Best John Doe there ever was"
  end

  factory :data_source do
    source_file_name "db.csv"
    source_file_size 1024
    source_content_type "text/plain"
    source_updated_at DateTime.now
  end
end
