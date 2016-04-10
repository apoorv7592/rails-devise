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

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if params[:cat_id].present?
      @products = Category.find(params[:cat_id]).products.paginate(:page => params[:page], :per_page => 10)
    elsif params[:company_id].present?
      @products = Company.find(params[:company_id]).products.paginate(:page => params[:page], :per_page => 10)
    else
      @products = Product.paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @valid_category = @product.categories.pluck(:id)
    @valid_company = @product.company_id.to_s
    @product_sizes = @product.product_sizes
  end

  # POST /products
  # POST /products.json
  def create
    @product.company_id = params[:company_id]
    @product = Product.new(product_params)
    images = params[:product][:image]
    @product.sizes = params[:sizes]
    @product.product_categories = params[:product_categories]
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product.product_categories = params[:product][:product_categories].reject(&:empty?)
    @product.sizes = params[:sizes]
    @product.product_sizes.destroy_all
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :url, :meta_title,:meta_description,:meta_keywords,:company_id,:price,:mrp,:weight,:rank,:status, image: [], sizes: [], product_categories: [])
    end
end
