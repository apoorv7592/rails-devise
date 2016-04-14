require 'rails_helper'

RSpec.describe "invoices/new", type: :view do
  before(:each) do
    assign(:invoice, Invoice.new(
      :order_id => 1,
      :invoice_note => "MyText",
      :admin_user_id => 1
    ))
  end

  it "renders new invoice form" do
    render

    assert_select "form[action=?][method=?]", invoices_path, "post" do

      assert_select "input#invoice_order_id[name=?]", "invoice[order_id]"

      assert_select "textarea#invoice_invoice_note[name=?]", "invoice[invoice_note]"

      assert_select "input#invoice_admin_user_id[name=?]", "invoice[admin_user_id]"
    end
  end
end
