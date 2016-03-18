require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :name => "Name",
        :contact => "Contact",
        :address => "Address"
      ),
      Company.create!(
        :name => "Name",
        :contact => "Contact",
        :address => "Address"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
  end
end
