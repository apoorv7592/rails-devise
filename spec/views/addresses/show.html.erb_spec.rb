require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :user_id => 1,
      :first_name => "First Name",
      :last_name => "Last Name String",
      :address => "MyText",
      :landmark => "MyText",
      :mobile => "Mobile",
      :pincode => 2,
      :status => 3,
      :city => "City",
      :state => "State",
      :country => "Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name String/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
  end
end
