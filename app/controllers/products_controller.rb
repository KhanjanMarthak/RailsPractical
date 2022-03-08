class ProductsController < ApplicationController 
  def products
    @products= Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new 
    @product = Product.new
  end

  def create
    puts params
    @product= Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    end
  end

  def edit
    @product = Product.find(params[:id])
  end 

  def update
    puts params
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)  
  end
    
  def destroy
    @product= Product.find(params[:id])
    @product.destroy
    redirect_to product_path(@product)
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :description, :team_size, :charges)
  end

end
