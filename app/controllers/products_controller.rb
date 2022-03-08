class ProductsController < ApplicationController
    
    def products
      @products= Product.all
    end

    def show
      @products = Product.all
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

    private
    def product_params
      params.require(:product).permit(:product_name, :description, :team_size, :charges)
    end
    def update
    
    end
 
end
