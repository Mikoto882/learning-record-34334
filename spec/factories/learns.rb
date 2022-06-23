FactoryBot.define do
  factory :learn do
    title         {'test'}
    description   {'test'}
    subject_id    {2}
    study_hour    {'2'}
    study_minutes {'30'}

    association :user

    after(:build) do |learn|
      learn.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
