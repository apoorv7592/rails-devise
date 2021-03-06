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

class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.includes(:order_products, :user, :address).order("id DESC").paginate(:page => params[:page], :per_page => 10)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order_products = @order.order_products.includes(product_size: [product: :images])
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.coupon_code = params[:order][:coupon_code]
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html {render :new}
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_path , notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def cancelled
    @order = Order.find(params[:id])
    @order.status = "cancelled"
    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path , notice: 'Order was successfully cancelled.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      order_hash = params.require(:order).permit(:address_id, :user_id, :cod_money, :shipping_money, :payment_gateway, :admin_user_id, :invoice_id, :note, :coupon_code, deliver_time: [:start_time, :end_time], prescription: [:detail, images:[:id, :url]])
      order_hash.merge! params.require(:order).permit(:status) #if params["order"]["status"] == "cancelled" ||  params["order"]["status"] == "on_hold"
      if params.require(:order)[:order_products_attributes].present?
        order_hash[:order_products_attributes]=[]
        params.require(:order).require(:order_products_attributes).map { |order_product| order_hash[:order_products_attributes]<< order_product.permit(:product_size_id, :quantity, :price) }
      end
      #order_hash[:user_id] = current_user.id
      order_hash
    end
end
