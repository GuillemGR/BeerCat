class CathegoriesController < ApplicationController
  before_action :set_cathegory, only: [:show, :edit, :update, :destroy]
  before_action :check_is_admin, only: [:new, :edit, :create, :update, :destroy]

  # GET /cathegories
  # GET /cathegories.json
  def index
    @cathegories = Cathegory.all
  end

  # GET /cathegories/1
  # GET /cathegories/1.json
  def show
    @product_list = @cathegory.products
  end

  # GET /cathegories/new
  def new
    @cathegory = Cathegory.new
  end

  # GET /cathegories/1/edit
  def edit
  end

  # POST /cathegories
  # POST /cathegories.json
  def create
    @cathegory = Cathegory.new(cathegory_params)

    respond_to do |format|
      if @cathegory.save
        format.html { redirect_to @cathegory, notice: 'Cathegory was successfully created.' }
        format.json { render :show, status: :created, location: @cathegory }
      else
        format.html { render :new }
        format.json { render json: @cathegory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cathegories/1
  # PATCH/PUT /cathegories/1.json
  def update
    respond_to do |format|
      if @cathegory.update(cathegory_params)
        format.html { redirect_to @cathegory, notice: 'Cathegory was successfully updated.' }
        format.json { render :show, status: :ok, location: @cathegory }
      else
        format.html { render :edit }
        format.json { render json: @cathegory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cathegories/1
  # DELETE /cathegories/1.json
  def destroy
    @cathegory.destroy
    respond_to do |format|
      format.html { redirect_to cathegories_url, notice: 'Cathegory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def check_is_admin
      unless admin_signed_in?
        redirect_to '/welcome'
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_cathegory
      @cathegory = Cathegory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cathegory_params
      params.require(:cathegory).permit(:name)
    end
end
