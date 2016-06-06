require 'rails_helper'

RSpec.describe "devices/new", type: :view do
  before(:each) do
    assign(:device, Device.new(
      :id => 1,
      :user_id => 1,
      :token => "MyString",
      :enabled => false,
      :platform => "MyString"
    ))
  end

  it "renders new device form" do
    render

    assert_select "form[action=?][method=?]", devices_path, "post" do

      assert_select "input#device_id[name=?]", "device[id]"

      assert_select "input#device_user_id[name=?]", "device[user_id]"

      assert_select "input#device_token[name=?]", "device[token]"

      assert_select "input#device_enabled[name=?]", "device[enabled]"

      assert_select "input#device_platform[name=?]", "device[platform]"
    end
  end
end
