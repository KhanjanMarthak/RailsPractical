class OrdersController < ApplicationController
  def index
    @order = Order.all
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
    @order = Order.create(order_params)
    if @order.save
      redirect_to orders_path(@order)
    else
      puts "not creating"
    end
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to orders_path(@order)
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:quantity,:total_price,:aqproduct_id,:customer_id,:status)
  end
end
