require 'rails_helper'

RSpec.describe "homes/new", type: :view do
  before(:each) do
    assign(:home, Home.new(
      :banner_name => "MyString",
      :path => "MyString",
      :classified_as => 1
    ))
  end

  it "renders new home form" do
    render

    assert_select "form[action=?][method=?]", homes_path, "post" do

      assert_select "input#home_banner_name[name=?]", "home[banner_name]"

      assert_select "input#home_path[name=?]", "home[path]"

      assert_select "input#home_classified_as[name=?]", "home[classified_as]"
    end
  end
end
