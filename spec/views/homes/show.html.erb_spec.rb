require 'rails_helper'

RSpec.describe "homes/show", type: :view do
  before(:each) do
    @home = assign(:home, Home.create!(
      :banner_name => "Banner Name",
      :path => "Path",
      :classified_as => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Banner Name/)
    expect(rendered).to match(/Path/)
    expect(rendered).to match(/1/)
  end
end
