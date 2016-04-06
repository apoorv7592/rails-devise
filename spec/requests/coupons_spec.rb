# == Schema Information
#
# Table name: coupons
#
#  id                 :integer          not null, primary key
#  code               :string
#  valid_product      :text
#  valid_category     :text
#  valid_company      :text
#  valid_city         :text
#  value              :integer
#  value_type         :integer
#  qualifying_amount  :integer
#  max_discount       :integer
#  max_usage          :integer
#  max_usage_per_user :integer
#  expire_date        :datetime
#  start_date         :datetime
#  success_message    :string
#  coupon_message     :string
#  status             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe "Coupons", type: :request do
  describe "GET /coupons" do
    it "works! (now write some real specs)" do
      get coupons_path
      expect(response).to have_http_status(200)
    end
  end
end
