require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :name => "Name",
      :contact => "Contact",
      :address => "Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/Address/)
  end
end
