class CustomersController < ApplicationController
  def index
    @customer = Customer.all
  end
  
  def new
    @customer=Customer.new  
  end
  
  def show
   @customer= Customer.find(params[:id])
  end 
  
  def edit
    @customer =Customer.find(params[:id])
  end
  
  def create
    @customer = Customer.create(customer_params)
    if @customer.save
      redirect_to customers_path(@customer)
    end
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customers_path(@customer)
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path(@customer)
  end

  private
  def customer_params
    params.require(:customer).permit(:fname , :lname, :email, :phone)
  end
end
