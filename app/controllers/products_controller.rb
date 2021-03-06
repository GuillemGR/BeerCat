class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :check_is_admin, only: [:new, :edit, :create, :update, :destroy]
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    if params[:cathegory]
      @products = Product.where(cathegory_id: params[:cathegory]).find_each
    end
    if params[:query]
      @products = Product.where("name like ? OR producer like ?", "%#{params[:query]}%", "%#{params[:query]}%").find_each
    end


  end

  # GET /products/1
  # GET /products/1.json
  def show
    @description
    if params[:locale] == 'es'
      @description = @product.descriptions.find_by(language: 'es').description
    end
    if params[:locale] == 'cat'
      @description = @product.descriptions.find_by(language: 'cat').description
    end
    if params[:locale] == 'en'
      @description = @product.descriptions.find_by(language: 'en').description
    end
    if params[:locale].nil?
     @description = @product.descriptions.find_by(language: 'cat').description
    end
    @cathegory =  Cathegory.find(@product.cathegory_id).name
  end

  # GET /products/new
  def new
    if admin_signed_in?
    @product = Product.new
    @cathegories = Cathegory.all
    else
      redirect_to '/'
    end
  end

  # GET /products/1/edit
  def edit
      @description_es = @product.descriptions.find_by(language: 'es').description

      @description_cat = @product.descriptions.find_by(language: 'cat').description

      @description_en = @product.descriptions.find_by(language: 'en').description

    @cathegory =  Cathegory.find(@product.cathegory_id).name
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    Description.create(product: @product, language: 'es', description: params[:product][:description_es])
    Description.create(product: @product, language: 'cat', description: params[:product][:description_cat])
    Description.create(product: @product, language: 'en', description: params[:product][:description_en])


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
    @product.descriptions.find_by(language: 'es').update(description: params[:product][:description_es])
    @product.descriptions.find_by(language: 'cat').update(description: params[:product][:description_cat])
    @product.descriptions.find_by(language: 'en').update(description: params[:product][:description_en])

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

    def check_is_admin
      unless admin_signed_in?
        redirect_to '/welcome'
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :image, :producer, :quantity, :cathegory_id)
    end
end
