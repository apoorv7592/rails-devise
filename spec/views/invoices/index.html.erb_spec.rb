require 'rails_helper'

RSpec.describe "invoices/index", type: :view do
  before(:each) do
    assign(:invoices, [
      Invoice.create!(
        :order_id => 1,
        :invoice_note => "MyText",
        :admin_user_id => 2
      ),
      Invoice.create!(
        :order_id => 1,
        :invoice_note => "MyText",
        :admin_user_id => 2
      )
    ])
  end

  it "renders a list of invoices" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
