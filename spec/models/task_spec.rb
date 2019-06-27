require 'rails_helper'

RSpec.describe Task, type: :model do
  subject {
    described_class.new(description: 'task description')
  }

  describe "validations" do
    it "validates user presence" do
      user = build(:user)
      subject.user = user

      expect(subject).to be_valid
      subject.user = nil

      expect(subject).not_to be_valid
      expect(subject.errors.keys).to include(:user)
      expect(subject.errors[:user]).to include("must exist")
    end

    it "validates description presence" do
      user = build(:user)
      subject.user = user

      expect(subject).to be_valid
      subject.description = nil

      expect(subject).not_to be_valid
      expect(subject.errors.keys).to include(:description)
      expect(subject.errors[:description]).to include("can't be blank")
    end
  end

  describe "associations" do
    it "has no events" do
      user = build(:user)
      task = create(:task, user: user)

      expect(task.events.count).to be(0)
    end

    it "has many events" do
      user = build(:user)
      task = create(:task, user: user)

      4.times do |event|
        event = create(:event, event_type: "congratulation", content: { "color": "color", "message": "message" }, task: task)
      end

      expect(task.events.count).to be(4)
    end
  end 
end