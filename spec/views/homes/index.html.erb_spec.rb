require 'rails_helper'

RSpec.describe "homes/index", type: :view do
  before(:each) do
    assign(:homes, [
      Home.create!(
        :banner_name => "Banner Name",
        :path => "Path",
        :classified_as => 1
      ),
      Home.create!(
        :banner_name => "Banner Name",
        :path => "Path",
        :classified_as => 1
      )
    ])
  end

  it "renders a list of homes" do
    render
    assert_select "tr>td", :text => "Banner Name".to_s, :count => 2
    assert_select "tr>td", :text => "Path".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
