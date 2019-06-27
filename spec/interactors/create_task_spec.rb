describe CreateTask do
  let!(:user) { create :user }
  subject(:context_success) { CreateTask.call(user: user, params: { description: "task description" }) }
  subject(:context_fail) { CreateTask.call(user: user, params: { description: "" }) }
  
  describe ".call" do
    context "when given valid params" do
      it "succeeds" do
        expect(context_success).to be_a_success
      end

      it "fails" do
        expect(context_fail).to be_a_failure
      end

      it "provides the user" do
        expect(context_success.user).to eq(user)
      end

      it "provides the task description" do
        task = create(:task, description: "task description", user: user)
        expect(context_success.task.description).to eq(task.description)
      end
    end
  end
end
