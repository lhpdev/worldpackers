FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User Name-#{n}"}
    sequence(:email) { |n| "user-#{n}@email.com" }
    password { 'f4k3p455w0rd' }
  end
end