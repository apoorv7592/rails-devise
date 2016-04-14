require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/MyText/)
  end
end
