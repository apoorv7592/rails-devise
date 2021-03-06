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

class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  # GET /homes
  # GET /homes.json
  def index
    @banner = Home.order("rank ASC").where(classified_as: 0)
    @offer = Home.order("rank ASC").where(classified_as: 1)
    @top_trend = Product.last(10)
    @popular = Product.last(10)
  end

  # GET /homes/1
  # GET /homes/1.json
  def show
  end

  # GET /homes/new
  def new
    @home = Home.new
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes
  # POST /homes.json
  def create
    @home = Home.new(home_params)
    cat_id = Category.find_by_id(params[:categories_path].to_i).parent_id
    path = {}
    path.merge!(cat_id: cat_id)
    path.merge!(subcat_id: params[:categories_path])
    path.merge!(product_id: params[:products_path])
    @home.path = path
    images = params[:home][:image]
    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: 'Home was successfully created.' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1
  # PATCH/PUT /homes/1.json
  def update
    images = params[:home][:image]
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to @home, notice: 'Home was successfully updated.' }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: 'Home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params.require(:home).permit(:banner_name, :classified_as, :rank, image: [], path: {})
    end
end
