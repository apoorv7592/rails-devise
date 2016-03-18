require 'rails_helper'

RSpec.describe "categories/edit", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :name => "MyString",
      :description => "MyString",
      :status => 1,
      :url_string => "MyString",
      :seo_title => "MyString",
      :seo_meta => "MyString"
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input#category_name[name=?]", "category[name]"

      assert_select "input#category_description[name=?]", "category[description]"

      assert_select "input#category_status[name=?]", "category[status]"

      assert_select "input#category_url_string[name=?]", "category[url_string]"

      assert_select "input#category_seo_title[name=?]", "category[seo_title]"

      assert_select "input#category_seo_meta[name=?]", "category[seo_meta]"
    end
  end
end
