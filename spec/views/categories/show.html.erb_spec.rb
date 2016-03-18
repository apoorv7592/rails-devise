require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :name => "Name",
      :description => "Description",
      :status => 1,
      :url_string => "Url String",
      :seo_title => "Seo Title",
      :seo_meta => "Seo Meta"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Url String/)
    expect(rendered).to match(/Seo Title/)
    expect(rendered).to match(/Seo Meta/)
  end
end
