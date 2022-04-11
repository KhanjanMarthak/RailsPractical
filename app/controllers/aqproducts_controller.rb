class AqproductsController < ApplicationController
  def index
    @product = Aqproduct.all
  end
  
  def new
    @product=Aqproduct.new  
  end
  
  def show
   @product= Aqproduct.find(params[:id])
  end 
  
  def edit
    @product =Aqproduct.find(params[:id])
  end
  
  def create
    @product = Aqproduct.create(product_params)
    if @product.save
      redirect_to aqproducts_path(@product)
    end
  end
  
  def update
    @product = Aqproduct.find(params[:id])
    @product.update(product_params)
    redirect_to aqproducts_path(@product)
    @order= Order.where(aqproduct_id: @product).each do |f|
      f.total_price = @product.price * f.quantity
      f.save 
    end
  end
  
  def destroy
    @product = Aqproduct.find(params[:id])
    @product.destroy
    redirect_to aqproducts_path(@product)
  end

  def seperate
   @product= Aqproduct.all.unscoped
  end

  private
  def product_params
    params.require(:aqproduct).permit(:title , :description,:price, :capacity, :is_active, :status)
  end
  
end
