class EmployeesController < ApplicationController

  def index
    @employee= Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end
    
  def new
    @employee = Employee.new
  end

  def create
    @employee= Employee.new(employee_params)
    if @employee.valid?
      @employee.save 
      redirect_to employees_path(@employee)
    else 
      flash.now[:errors]= @employee.errors.full_messages
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end 

  def update
    puts params
    @employee= Employee.find(params[:id])
    @employee.update(employee_params)
    if @employee.valid?
      redirect_to employees_path(@employee)
    else 
      flash.now[:errors]= @employee.errors.full_messages
      render :new
    end  
  end
    
  def destroy
    @employee= Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path(@employee)
  end
  
  private
  def employee_params
    params.require(:employee).permit(:emp_first_name, :emp_last_name, :email, :age, :no_of_order, :full_time_available, :salary )
  end

end
