require 'rails_helper'

RSpec.describe "addresses/new", type: :view do
  before(:each) do
    assign(:address, Address.new(
      :user_id => 1,
      :first_name => "MyString",
      :last_name => "MyString",
      :address => "MyText",
      :landmark => "MyText",
      :mobile => "MyString",
      :pincode => 1,
      :status => 1,
      :city => "MyString",
      :state => "MyString",
      :country => "MyString"
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

      assert_select "input#address_user_id[name=?]", "address[user_id]"

      assert_select "input#address_first_name[name=?]", "address[first_name]"

      assert_select "input#address_last_name[name=?]", "address[last_name]"

      assert_select "textarea#address_address[name=?]", "address[address]"

      assert_select "textarea#address_landmark[name=?]", "address[landmark]"

      assert_select "input#address_mobile[name=?]", "address[mobile]"

      assert_select "input#address_pincode[name=?]", "address[pincode]"

      assert_select "input#address_status[name=?]", "address[status]"

      assert_select "input#address_city[name=?]", "address[city]"

      assert_select "input#address_state[name=?]", "address[state]"

      assert_select "input#address_country[name=?]", "address[country]"
    end
  end
end
