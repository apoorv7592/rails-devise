require 'rails_helper'

RSpec.describe "devices/index", type: :view do
  before(:each) do
    assign(:devices, [
      Device.create!(
        :id => 1,
        :user_id => 2,
        :token => "Token",
        :enabled => false,
        :platform => "Platform"
      ),
      Device.create!(
        :id => 1,
        :user_id => 2,
        :token => "Token",
        :enabled => false,
        :platform => "Platform"
      )
    ])
  end

  it "renders a list of devices" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Token".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Platform".to_s, :count => 2
  end
end
