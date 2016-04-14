require 'rails_helper'

RSpec.describe "invoices/edit", type: :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :order_id => 1,
      :invoice_note => "MyText",
      :admin_user_id => 1
    ))
  end

  it "renders the edit invoice form" do
    render

    assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do

      assert_select "input#invoice_order_id[name=?]", "invoice[order_id]"

      assert_select "textarea#invoice_invoice_note[name=?]", "invoice[invoice_note]"

      assert_select "input#invoice_admin_user_id[name=?]", "invoice[admin_user_id]"
    end
  end
end
