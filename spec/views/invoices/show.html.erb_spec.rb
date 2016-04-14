require 'rails_helper'

RSpec.describe "invoices/show", type: :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :order_id => 1,
      :invoice_note => "MyText",
      :admin_user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
