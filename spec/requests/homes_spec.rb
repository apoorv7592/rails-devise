# == Schema Information
#
# Table name: homes
#
#  id            :integer          not null, primary key
#  banner_name   :string
#  path          :string
#  classified_as :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rank          :integer
#

require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /homes" do
    it "works! (now write some real specs)" do
      get homes_path
      expect(response).to have_http_status(200)
    end
  end
end