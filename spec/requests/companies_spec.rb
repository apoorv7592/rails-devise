# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  contact    :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe "Companies", type: :request do
  describe "GET /companies" do
    it "works! (now write some real specs)" do
      get companies_path
      expect(response).to have_http_status(200)
    end
  end
end
