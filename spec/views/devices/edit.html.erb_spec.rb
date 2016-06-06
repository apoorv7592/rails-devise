require 'rails_helper'

RSpec.describe "devices/edit", type: :view do
  before(:each) do
    @device = assign(:device, Device.create!(
      :id => 1,
      :user_id => 1,
      :token => "MyString",
      :enabled => false,
      :platform => "MyString"
    ))
  end

  it "renders the edit device form" do
    render

    assert_select "form[action=?][method=?]", device_path(@device), "post" do

      assert_select "input#device_id[name=?]", "device[id]"

      assert_select "input#device_user_id[name=?]", "device[user_id]"

      assert_select "input#device_token[name=?]", "device[token]"

      assert_select "input#device_enabled[name=?]", "device[enabled]"

      assert_select "input#device_platform[name=?]", "device[platform]"
    end
  end
end
