require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :user_id => 1,
        :first_name => "First Name",
        :last_name => "Last Name String",
        :address => "MyText",
        :landmark => "MyText",
        :mobile => "Mobile",
        :pincode => 2,
        :status => 3,
        :city => "City",
        :state => "State",
        :country => "Country"
      ),
      Address.create!(
        :user_id => 1,
        :first_name => "First Name",
        :last_name => "Last Name String",
        :address => "MyText",
        :landmark => "MyText",
        :mobile => "Mobile",
        :pincode => 2,
        :status => 3,
        :city => "City",
        :state => "State",
        :country => "Country"
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name String".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
  end
end
