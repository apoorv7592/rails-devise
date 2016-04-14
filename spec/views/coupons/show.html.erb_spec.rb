require 'rails_helper'

RSpec.describe "coupons/show", type: :view do
  before(:each) do
    @coupon = assign(:coupon, Coupon.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/Success Message/)
    expect(rendered).to match(/Coupon Message/)
    expect(rendered).to match(/7/)
  end
end
