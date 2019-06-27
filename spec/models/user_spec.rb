require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(name: "Use Name", 
                        email: "user@email.com",
                        password: "password")
  }

  describe "validations" do
    it "validates name presence" do
      expect(subject).to be_valid
      subject.name = nil

      expect(subject).not_to be_valid
      expect(subject.errors.keys).to include(:name)
      expect(subject.errors[:name]).to include("can't be blank")
    end

    it "validates email presence" do
      expect(subject).to be_valid
      subject.email = nil
      
      expect(subject).not_to be_valid
      expect(subject.errors.keys).to include(:email)
      expect(subject.errors[:email]).to include("can't be blank")
    end

    it "validates password presence" do
      expect(subject).to be_valid
      subject.password = nil

      expect(subject).not_to be_valid
      expect(subject.errors.keys).to include(:password)
      expect(subject.errors[:password]).to include("can't be blank")
    end

    it "validates first name" do
      user = build(:user)
      expect(user.first_name).to include("User")
    end
  end

  describe "associations" do
    it "has no tasks" do
      user = build(:user)

      expect(user.tasks.count).to be(0)
    end

    it "has many tasks" do
      user = build(:user)

      4.times do |task|
        task = create(:task, user: user)
      end
      expect(user.tasks.count).to be(4)
    end
  end 
end