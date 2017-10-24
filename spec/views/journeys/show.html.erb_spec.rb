require 'rails_helper'

RSpec.describe "journeys/show", type: :view do
  let(:valid_attributes) { FactoryGirl.attributes_for(:journey)}

  before(:each) do
    @journey = assign(:journey, Journey.create!(valid_attributes))
  end

  it "renders attributes in <p>" do
    render
  end
end
