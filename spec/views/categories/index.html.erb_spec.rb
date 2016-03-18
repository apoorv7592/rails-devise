require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :name => "Name",
        :description => "Description",
        :status => 1,
        :url_string => "Url String",
        :seo_title => "Seo Title",
        :seo_meta => "Seo Meta"
      ),
      Category.create!(
        :name => "Name",
        :description => "Description",
        :status => 1,
        :url_string => "Url String",
        :seo_title => "Seo Title",
        :seo_meta => "Seo Meta"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Url String".to_s, :count => 2
    assert_select "tr>td", :text => "Seo Title".to_s, :count => 2
    assert_select "tr>td", :text => "Seo Meta".to_s, :count => 2
  end
end
