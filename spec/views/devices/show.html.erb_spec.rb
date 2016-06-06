require 'rails_helper'

RSpec.describe "devices/show", type: :view do
  before(:each) do
    @device = assign(:device, Device.create!(
      :id => 1,
      :user_id => 2,
      :token => "Token",
      :enabled => false,
      :platform => "Platform"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Token/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Platform/)
  end
end
