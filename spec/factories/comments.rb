FactoryBot.define do
  factory :comment do
    content {'test'}

    association :user
    association :learn
  end
end
