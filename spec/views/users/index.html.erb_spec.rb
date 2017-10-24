require 'rails_helper'

RSpec.describe "users/index", type: :view do
  let(:valid_attributes) { FactoryGirl.attributes_for(:user)}

  before(:each) do
    assign(:users, [
      User.create!(valid_attributes),
      User.create!(valid_attributes)
    ])
  end

  it "renders a list of users" do
    render
  end
end
