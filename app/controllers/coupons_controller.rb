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

class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :edit, :update, :destroy]

  # GET /coupons
  # GET /coupons.json
  def index
    @coupons = Coupon.all
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
  end

  # GET /coupons/new
  def new
    @coupon = Coupon.new
  end

  # GET /coupons/1/edit
  def edit
    @valid_category = (@coupon.valid_category.scan( /\d+/ )).map!{ |s| s.to_i }
    @valid_product = (@coupon.valid_product.scan( /\d+/ )).map!{ |s| s.to_i }
    @valid_company = (@coupon.valid_company.scan( /\d+/ )).map!{ |s| s.to_i }
  end

  # POST /coupons
  # POST /coupons.json
  def create
    params[:coupon][:code] = (params[:coupon][:code]).downcase
    params[:coupon][:valid_category] = (params[:valid_category]||{}).to_json
    params[:coupon][:valid_product] = (params[:valid_product]||{}).to_json
    params[:coupon][:valid_company] = (params[:valid_company]||{}).to_json
    @coupon = Coupon.new(coupon_params)
    respond_to do |format|
      if @coupon.save
        format.html { redirect_to @coupon, notice: 'Coupon was successfully created.' }
        format.json { render :show, status: :created, location: @coupon }
      else
        format.html { render :new }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupons/1
  # PATCH/PUT /coupons/1.json
  def update
    params[:coupon][:valid_category] = (params[:coupon][:valid_category]||{}).reject(&:empty?).to_json
    params[:coupon][:valid_product] = (params[:coupon][:valid_product]||{}).reject(&:empty?).to_json
    params[:coupon][:valid_company] = (params[:coupon][:valid_company]||{}).reject(&:empty?).to_json
    respond_to do |format|
      if @coupon.update(coupon_params)
        format.html { redirect_to @coupon, notice: 'Coupon was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon }
      else
        format.html { render :edit }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon.destroy
    respond_to do |format|
      format.html { redirect_to coupons_url, notice: 'Coupon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_coupon
    @coupon = Coupon.find_by(code: params[:coupon_code])
    if @coupon.present?
      products = params[:products]
      amount = 0
      products.each do |product|
        price = ProductSize.find(product[:product_size_id]).price
        quantity = product[:quantity]
        temp_amount = price * quantity
        amount += temp_amount
      end 
      if (amount >= @coupon.qualifying_amount) and (@coupon.expire_date > Date.today) and (@coupon.start_date  < Date.today + 1.day)  and (@coupon.status == "enabled")
        total_discount_value = @coupon.value_type=="percentage" ? (@coupon.value * amount * 0.01) : @coupon.value
        discount_amount = total_discount_value > @coupon.max_discount ? @coupon.max_discount : total_discount_value
      else
        discount_amount = 0
      end
      @object = {}
      @object[:total_amount] = amount.to_i
      @object[:discount_amount] = discount_amount.to_i
      @object[:amount_payable]  = amount.to_i - discount_amount.to_i
      @object[:success_message]  = @coupon.success_message + " you will get Rs. #{discount_amount.to_i} off"
      render json: @object
    else
      flash[:error] = 'Invalid Coupon'  
      render json: flash
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_params
      params.require(:coupon).permit(:code, :valid_city, :value, :value_type, :qualifying_amount, :max_discount, :max_usage, :max_usage_per_user, :expire_date, :start_date, :success_message, :coupon_message, :status, :valid_product, :valid_category, :valid_company)
    end
end
