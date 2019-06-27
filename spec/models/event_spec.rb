require 'rails_helper'

RSpec.describe Event, type: :model do
  subject {
    described_class.new(event_type: "congratulation",   
                        content: {
                          "color": "#ffffff",
                          "message": "message"})
  }

  describe "validations" do
    it "validates event_type presence" do
      user = build(:user)
      task = create(:task, user: user)
      subject.task = task

      expect(subject).to be_valid
      subject.event_type = nil

      expect(subject).not_to be_valid
      expect(subject.errors.keys).to include(:event_type)
      expect(subject.errors[:event_type]).to include("can't be blank")
    end

    # it "validates event_type enum" do
    #   user = build(:user)
    #   task = create(:task, user: user)
    #   subject.task = task

    #   expect(subject).to be_valid
    #   subject.event_type = "shame"
    #   expect(subject).to be_valid

    #   expect(subject.event_type = "somethingelse").not_to be_valid
    # end

    it "validates event_type presence" do
      user = build(:user)
      task = create(:task, user: user)
      subject.task = task

      expect(subject).to be_valid
      subject.content = nil

      expect(subject).not_to be_valid
      expect(subject.errors.keys).to include(:content)
      expect(subject.errors[:content]).to include("can't be blank")
    end
  end
end