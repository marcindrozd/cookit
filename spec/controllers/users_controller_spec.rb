require 'spec_helper'

describe UsersController do
  describe "GET new" do
    it "creates new user object" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe "POST create" do
    context "with valid data" do
      before do
        post :create, user: Fabricate.attributes_for(:user)
      end

      it "creates a new user" do
        expect(User.count).to eq(1)
      end

      it "redirects to home page for successfully created user" do
        expect(response).to redirect_to home_path
      end
    end

    context "with invalid data" do
      before do
        post :create, user: { full_name: Faker::Name.name, password: "password" }
      end

      it "does not create a new user" do
        expect(User.count).to eq(0)
      end

      it "renders new template" do
        expect(response).to render_template :new
      end
    end
  end

  describe "GET show" do
    it "redirects unauthenticated user to root path" do
      get :show, id: Fabricate(:user).id
      expect(response).to redirect_to root_path
    end
  end
end
