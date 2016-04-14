# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :text
#  url              :string(100)
#  meta_title       :string
#  meta_description :text
#  meta_keywords    :text
#  company_id       :integer
#  rank             :integer
#  status           :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    it "works! (now write some real specs)" do
      get products_path
      expect(response).to have_http_status(200)
    end
  end
end
