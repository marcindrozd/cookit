require 'spec_helper'

describe SessionsController do
  describe "GET new" do
    it "redirects logged in user to home path" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end

    it "renders new template for unauthenticated user" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "with valid credentials" do
      let(:joe) { Fabricate(:user) }

      before do
        post :create, session: { email_address: joe.email_address, password: joe.password }
      end

      it "logs the user in" do
        expect(session[:user_id]).to eq(joe.id)
      end

      it "redirects logged in user to home path" do
        expect(response).to redirect_to home_path
      end

      it "flashes the success message" do
        expect(flash[:success]).not_to be_blank
      end
    end

    context "with invalid credentials" do
      let(:joe) { Fabricate(:user) }

      before do
        post :create, session: { email_address: joe.email_address, password: "wrong password" }
      end

      it "does not log the user in" do
        expect(session[:user_id]).not_to eq(joe.id)
      end

      it "flashes the error message" do
        expect(flash[:danger]).not_to be_blank
      end

      it "renders the new template" do
        expect(response).to render_template :new
      end
    end
  end

  describe "DELETE destroy" do
    let(:joe) { Fabricate(:user) }

    before do
      session[:user_id] = joe.id
      delete :destroy
    end

    it "removes user from session" do
      expect(session[:user_id]).to be_nil
    end

    it "redirects to root path" do
      expect(response).to redirect_to root_path
    end

    it "displays the success message" do
      expect(flash[:success]).not_to be_blank
    end
  end
end
