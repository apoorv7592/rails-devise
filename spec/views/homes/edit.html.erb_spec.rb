require 'rails_helper'

RSpec.describe "homes/edit", type: :view do
  before(:each) do
    @home = assign(:home, Home.create!(
      :banner_name => "MyString",
      :path => "MyString",
      :classified_as => 1
    ))
  end

  it "renders the edit home form" do
    render

    assert_select "form[action=?][method=?]", home_path(@home), "post" do

      assert_select "input#home_banner_name[name=?]", "home[banner_name]"

      assert_select "input#home_path[name=?]", "home[path]"

      assert_select "input#home_classified_as[name=?]", "home[classified_as]"
    end
  end
end
