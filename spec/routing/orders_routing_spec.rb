# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  address_id      :integer
#  user_id         :integer
#  cod_money       :integer
#  shipping_money  :integer
#  status          :integer          default(0)
#  is_confirm      :integer          default(0)
#  payment_gateway :integer
#  admin_user_id   :integer
#  invoice_id      :integer
#  note            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require "rails_helper"

RSpec.describe OrdersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/orders").to route_to("orders#index")
    end

    it "routes to #new" do
      expect(:get => "/orders/new").to route_to("orders#new")
    end

    it "routes to #show" do
      expect(:get => "/orders/1").to route_to("orders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/orders/1/edit").to route_to("orders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/orders").to route_to("orders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/orders/1").to route_to("orders#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/orders/1").to route_to("orders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/orders/1").to route_to("orders#destroy", :id => "1")
    end

  end
end
