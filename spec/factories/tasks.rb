FactoryBot.define do
  factory :task do
    association :user, factory: :user
    sequence(:description) { |n| "Task description-#{n}"}
  end
end