# == Schema Information
#
# Table name: product_sizes
#
#  id         :integer          not null, primary key
#  product_id :integer          not null
#  size       :string           not null
#  qty_avail  :integer          default(0)
#  size_unit  :integer          default(0)
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  weight     :integer
#  mrp        :integer
#  price      :integer
#

class ProductSizesController < ApplicationController
  before_action :set_product_size, only: [:show, :edit, :update, :destroy]

  # GET /product_sizes
  # GET /product_sizes.json
  def index
    @product_sizes = ProductSize.all
  end

  # GET /product_sizes/1
  # GET /product_sizes/1.json
  def show
  end

  # GET /product_sizes/new
  def new
    @product_size = ProductSize.new
  end

  # GET /product_sizes/1/edit
  def edit
  end

  # POST /product_sizes
  # POST /product_sizes.json
  def create
    binding.pry
    @product_size = ProductSize.new(product_size_params)
    respond_to do |format|
      if @product_size.save
        format.html { redirect_to @product_size, notice: 'Product_size was successfully created.' }
        format.json { render :show, status: :created, location: @product_size }
      else
        format.html { render :new }
        format.json { render json: @product_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_sizes/1
  # PATCH/PUT /product_sizes/1.json
  def update
    respond_to do |format|
      if @product_size.update(product_size_params)
        format.html { redirect_to @product_size, notice: 'Product_size was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_size }
      else
        format.html { render :edit }
        format.json { render json: @product_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_sizes/1
  # DELETE /product_sizes/1.json
  def destroy
    @product_size.destroy
    respond_to do |format|
      format.html { redirect_to product_sizes_url, notice: 'Product_size was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_size
      @product_size = ProductSize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_size_params
      params.require(:product_size).permit(:product_id, :size, :qty_avail, :size_unit, :status, :weight, :mrp, :price)
    end
end
