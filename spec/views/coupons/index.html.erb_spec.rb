require 'rails_helper'

RSpec.describe "coupons/index", type: :view do
  before(:each) do
    assign(:coupons, [
      Coupon.create!(
        :code => "Code",
        :valid_product => "MyText",
        :valid_category => "MyText",
        :valid_company => "MyText",
        :valid_city => "MyText",
        :value => 1,
        :value_type => 2,
        :qualifying_amount => 3,
        :max_discount => 4,
        :max_usage => 5,
        :max_usage_per_user => 6,
        :success_message => "Success Message",
        :coupon_message => "Coupon Message",
        :status => 7
      ),
      Coupon.create!(
        :code => "Code",
        :valid_product => "MyText",
        :valid_category => "MyText",
        :valid_company => "MyText",
        :valid_city => "MyText",
        :value => 1,
        :value_type => 2,
        :qualifying_amount => 3,
        :max_discount => 4,
        :max_usage => 5,
        :max_usage_per_user => 6,
        :success_message => "Success Message",
        :coupon_message => "Coupon Message",
        :status => 7
      )
    ])
  end

  it "renders a list of coupons" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => "Success Message".to_s, :count => 2
    assert_select "tr>td", :text => "Coupon Message".to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
  end
end
