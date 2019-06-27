FactoryBot.define do
  factory :event do
    association :task, factory: :task
  end
end