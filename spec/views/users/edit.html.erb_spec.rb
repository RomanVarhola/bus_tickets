require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  let(:valid_attributes) { FactoryGirl.attributes_for(:user)}

  before(:each) do
    @user = assign(:user, User.create!(valid_attributes))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do
    end
  end
end
