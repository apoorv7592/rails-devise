require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :address_id => 1,
      :user_id => 1,
      :cod_money => 1,
      :shipping_money => 1,
      :status => 1,
      :is_confirm => 1,
      :payment_gateway => 1,
      :admin_user_id => 1,
      :invoice_id => 1,
      :note => "MyText"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_address_id[name=?]", "order[address_id]"

      assert_select "input#order_user_id[name=?]", "order[user_id]"

      assert_select "input#order_cod_money[name=?]", "order[cod_money]"

      assert_select "input#order_shipping_money[name=?]", "order[shipping_money]"

      assert_select "input#order_status[name=?]", "order[status]"

      assert_select "input#order_is_confirm[name=?]", "order[is_confirm]"

      assert_select "input#order_payment_gateway[name=?]", "order[payment_gateway]"

      assert_select "input#order_admin_user_id[name=?]", "order[admin_user_id]"

      assert_select "input#order_invoice_id[name=?]", "order[invoice_id]"

      assert_select "textarea#order_note[name=?]", "order[note]"
    end
  end
end
