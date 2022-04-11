class OrdersController < ApplicationController
  def index
    @order = Order.all
    @search =  Order.search(params[:search])
    if params[:filter]
      @order= Order.where(status:"booked") if params[:filter]=='booked'
      @order= Order.where(status:"cancelled") if params[:filter]=='cancelled'
    end
  end
  
  def new
    @order=Order.new  
  end
  
  def show
   @order= Order.find(params[:id])
  end 
  
  def edit
    @order =Order.find(params[:id]) 
  end
  
  def create
    @order = Order.new(order_params)
    @temp= order_params[:aqproduct_id]
    @product_price = Aqproduct.find(@temp)
    @order.total_price = @product_price.price * @order.quantity
    if @order.save
      redirect_to orders_path(@order)
    else
      puts "not creating"
    end
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @temp= order_params[:aqproduct_id]
    @product_price = Aqproduct.find(@temp)
    @order.total_price = @product_price.price * @order.quantity
    @order.save
    redirect_to orders_path(@order)
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path(@order)
  end
  
  def root 
     @order = Order.all
  end

  private
  def order_params
    params.require(:order).permit(:quantity,:total_price,:aqproduct_id,:customer_id,:status, :search)
  end
  
end
