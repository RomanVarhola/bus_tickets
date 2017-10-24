require 'rails_helper'

RSpec.describe "users/show", type: :view do
  let(:valid_attributes) { FactoryGirl.attributes_for(:user)}

  before(:each) do
    @user = assign(:user, User.create!(valid_attributes))
  end

  it "renders attributes in <p>" do
    render
  end
end
