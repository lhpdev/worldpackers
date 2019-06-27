require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  login_user
  
  let(:valid_attributes) {
    { description: "that is a task description" }
  }

  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

  describe "GET index" do
    it "should get index" do
      get :index
      response.should be_successful
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show/:id" do
    it "should get show" do
      task = create(:task, user: subject.current_user)

      get :show, params: { id: task.id }
      response.should be_successful
    end

    it "renders the show template" do
      task = create(:task, user: subject.current_user)

      get :show, params: { id: task.id }
      expect(response).to render_template("show")
    end
  end

  describe "GET tasks/new" do
    it "should get new" do
      post :new
      response.should be_successful
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
end
