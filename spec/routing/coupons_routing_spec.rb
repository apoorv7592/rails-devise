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

require "rails_helper"

RSpec.describe CouponsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/coupons").to route_to("coupons#index")
    end

    it "routes to #new" do
      expect(:get => "/coupons/new").to route_to("coupons#new")
    end

    it "routes to #show" do
      expect(:get => "/coupons/1").to route_to("coupons#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/coupons/1/edit").to route_to("coupons#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/coupons").to route_to("coupons#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/coupons/1").to route_to("coupons#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/coupons/1").to route_to("coupons#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/coupons/1").to route_to("coupons#destroy", :id => "1")
    end

  end
end
