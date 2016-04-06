require 'rails_helper'

RSpec.describe "coupons/edit", type: :view do
  before(:each) do
    @coupon = assign(:coupon, Coupon.create!(
      :code => "MyString",
      :valid_product => "MyText",
      :valid_category => "MyText",
      :valid_company => "MyText",
      :valid_city => "MyText",
      :value => 1,
      :value_type => 1,
      :qualifying_amount => 1,
      :max_discount => 1,
      :max_usage => 1,
      :max_usage_per_user => 1,
      :success_message => "MyString",
      :coupon_message => "MyString",
      :status => 1
    ))
  end

  it "renders the edit coupon form" do
    render

    assert_select "form[action=?][method=?]", coupon_path(@coupon), "post" do

      assert_select "input#coupon_code[name=?]", "coupon[code]"

      assert_select "textarea#coupon_valid_product[name=?]", "coupon[valid_product]"

      assert_select "textarea#coupon_valid_category[name=?]", "coupon[valid_category]"

      assert_select "textarea#coupon_valid_company[name=?]", "coupon[valid_company]"

      assert_select "textarea#coupon_valid_city[name=?]", "coupon[valid_city]"

      assert_select "input#coupon_value[name=?]", "coupon[value]"

      assert_select "input#coupon_value_type[name=?]", "coupon[value_type]"

      assert_select "input#coupon_qualifying_amount[name=?]", "coupon[qualifying_amount]"

      assert_select "input#coupon_max_discount[name=?]", "coupon[max_discount]"

      assert_select "input#coupon_max_usage[name=?]", "coupon[max_usage]"

      assert_select "input#coupon_max_usage_per_user[name=?]", "coupon[max_usage_per_user]"

      assert_select "input#coupon_success_message[name=?]", "coupon[success_message]"

      assert_select "input#coupon_coupon_message[name=?]", "coupon[coupon_message]"

      assert_select "input#coupon_status[name=?]", "coupon[status]"
    end
  end
end
