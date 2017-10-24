require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:role) {FactoryGirl.create(:role)}
  let(:user) {FactoryGirl.attributes_for(:user)}
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:user)
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }


  before(:each) do
    user = role.users.build valid_attributes
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "GET #index" do
    it "assigns all users as @users" do
      user = role.users.create! valid_attributes
      get :index, {}, session: valid_session
      expect(assigns(:user)).to eq([user])
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      user = role.users.create! valid_attributes
      get :show, {id: user.to_param}
      expect(assigns(:user)).to eq(@user)
    end
  end

  describe "GET #edit" do
    it "assigns the requested user as @user" do
      user = role.users.create! valid_attributes
      get :edit, {id: user.to_param}, session: valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  
  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested user" do
        user = role.users.create! valid_attributes
        put :update, {id: user.to_param, user: new_attributes}, session: valid_session
        user.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested user as @user" do
        user = role.users.create! valid_attributes
        put :update, {id: user.to_param, user: valid_attributes}, session: valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        user = role.users.create! valid_attributes
        put :update,  {id: user.to_param, user: valid_attributes}, session: valid_session
        expect(response).to redirect_to(user)
      end
    end

    context "with invalid params" do
      it "assigns the user as @user" do
        user = role.users.create! valid_attributes
        put :update,  {id: user.to_param, user: invalid_attributes}, session: valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        user = role.users.create! valid_attributes
        put :update, {id: user.to_param, user: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = role.users.create! valid_attributes
        expect {
        delete :destroy,  {id: user.to_param}, session: valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      user = role.users.create! valid_attributes
      delete :destroy,  {id: user.to_param}, session: valid_session
      expect(response).to redirect_to(users_url)
    end
  end

end
