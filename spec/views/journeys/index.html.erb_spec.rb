require 'rails_helper'

RSpec.describe "journeys/index", type: :view do
  let(:user) { FactoryGirl.create(:user)}
  let(:valid_attributes) { FactoryGirl.attributes_for(:journey)}

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  
    assign(:journeys, [
      Journey.create!(valid_attributes),
      Journey.create!(valid_attributes),
      Journey.new
    ])
  end

  it "renders a list of journeys" do
    render
  end
end
