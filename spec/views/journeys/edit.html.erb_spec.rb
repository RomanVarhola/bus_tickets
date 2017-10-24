require 'rails_helper'

RSpec.describe "journeys/edit", type: :view do
  let(:valid_attributes) { FactoryGirl.attributes_for(:journey)}

	before(:each) do
    @journey = assign(:journey, Journey.create!(valid_attributes))
  end

  it "renders the edit journey form" do
    render

    assert_select "form[action=?][method=?]", journey_path(@journey), "post" do
    end
  end
end
