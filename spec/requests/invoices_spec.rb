# == Schema Information
#
# Table name: invoices
#
#  id            :integer          not null, primary key
#  order_id      :integer
#  invoice_note  :text
#  admin_user_id :integer
#  invoice_date  :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe "Invoices", type: :request do
  describe "GET /invoices" do
    it "works! (now write some real specs)" do
      get invoices_path
      expect(response).to have_http_status(200)
    end
  end
end
