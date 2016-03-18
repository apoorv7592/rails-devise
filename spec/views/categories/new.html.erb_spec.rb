require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    assign(:category, Category.new(
      :name => "MyString",
      :description => "MyString",
      :status => 1,
      :url_string => "MyString",
      :seo_title => "MyString",
      :seo_meta => "MyString"
    ))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do

      assert_select "input#category_name[name=?]", "category[name]"

      assert_select "input#category_description[name=?]", "category[description]"

      assert_select "input#category_status[name=?]", "category[status]"

      assert_select "input#category_url_string[name=?]", "category[url_string]"

      assert_select "input#category_seo_title[name=?]", "category[seo_title]"

      assert_select "input#category_seo_meta[name=?]", "category[seo_meta]"
    end
  end
end
