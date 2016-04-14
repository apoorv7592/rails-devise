require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :address_id => 1,
        :user_id => 2,
        :cod_money => 3,
        :shipping_money => 4,
        :status => 5,
        :is_confirm => 6,
        :payment_gateway => 7,
        :admin_user_id => 8,
        :invoice_id => 9,
        :note => "MyText"
      ),
      Order.create!(
        :address_id => 1,
        :user_id => 2,
        :cod_money => 3,
        :shipping_money => 4,
        :status => 5,
        :is_confirm => 6,
        :payment_gateway => 7,
        :admin_user_id => 8,
        :invoice_id => 9,
        :note => "MyText"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
