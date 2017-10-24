require 'rails_helper'

RSpec.describe JourneysController, type: :controller do
  let(:role) {FactoryGirl.create(:role)}
  let(:valid_attributes) { FactoryGirl.attributes_for(:journey)}
  let(:valid_attributes_user) { FactoryGirl.attributes_for(:user)}

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  before(:each) do
    user = role.users.build valid_attributes_user
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all journeys as @journeys" do
      journey = Journey.create! valid_attributes
      get :index,  {}, session: valid_session
      expect(assigns(:journeys)).to eq([journey])
    end
  end

  describe "GET #show" do
    it "assigns the requested journey as @journey" do
      journey = Journey.create! valid_attributes
      get :show, {id: journey.to_param}, session: valid_session
      expect(assigns(:journey)).to eq(journey)
    end
  end

  describe "GET #new" do
    it "assigns a new journey as @journey" do
      get :new, session: valid_session
      expect(assigns(:journey)).to be_a_new(Journey)
    end
  end

  describe "GET #edit" do
    it "assigns the requested journey as @journey" do
      journey = Journey.create! valid_attributes
      get :edit,  {id: journey.to_param}, session: valid_session
      expect(assigns(:journey)).to eq(journey)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Journey" do
        expect {
          post :create,  {journey: valid_attributes}, session: valid_session
        }.to change(Journey, :count).by(1)
      end

      it "assigns a newly created journey as @journey" do
        post :create,  {journey: valid_attributes}, session: valid_session
        expect(assigns(:journey)).to be_a(Journey)
        expect(assigns(:journey)).to be_persisted
      end

      it "redirects to the created journey" do
        post :create,  {journey: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Journey.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved journey as @journey" do
        post :create,  {journey: invalid_attributes}, session: valid_session
        expect(assigns(:journey)).to be_a_new(Journey)
      end

      it "re-renders the 'new' template" do
        post :create,  {journey: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested journey" do
        journey = Journey.create! valid_attributes
        put :update,  {id: journey.to_param, journey: new_attributes}, session: valid_session
        journey.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested journey as @journey" do
        journey = Journey.create! valid_attributes
        put :update,  {id: journey.to_param, journey: valid_attributes}, session: valid_session
        expect(assigns(:journey)).to eq(journey)
      end

      it "redirects to the journey" do
        journey = Journey.create! valid_attributes
        put :update,  {id: journey.to_param, journey: valid_attributes}, session: valid_session
        expect(response).to redirect_to(journey)
      end
    end

    context "with invalid params" do
      it "assigns the journey as @journey" do
        journey = Journey.create! valid_attributes
        put :update,  {id: journey.to_param, journey: invalid_attributes}, session: valid_session
        expect(assigns(:journey)).to eq(journey)
      end

      it "re-renders the 'edit' template" do
        journey = Journey.create! valid_attributes
        put :update,  {id: journey.to_param, journey: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested journey" do
      journey = Journey.create! valid_attributes
      expect {
        delete :destroy, {id: journey.to_param}, session: valid_session
      }.to change(Journey, :count).by(-1)
    end

    it "redirects to the journeys list" do
      journey = Journey.create! valid_attributes
      delete :destroy,  {id: journey.to_param}, session: valid_session
      expect(response).to redirect_to(journeys_url)
    end
  end

end
