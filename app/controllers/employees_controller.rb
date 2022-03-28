class EmployeesController < ApplicationController

  def index
    @employee= Employee.all
    if params[:check_mail]
      check_mail()
    end 
  end

  def show
    @employee = Employee.find(params[:id])
  end
    
  def new
    @employee = Employee.new
  end

  def create
    @employee= Employee.find_or_create_by(employee_params)
    if @employee.valid?
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

  #method to show the results of query tasks
  def results
    @employee= Employee.all
  end
  
  #method to check email existance
  def check_mail
    if @employee.where("email = ?",params[:check_mail])
      @employee.each do |e| 
        flash.now[:notice]= "Email Exists by " + " " + e.emp_first_name + " "+ e.emp_last_name
      end   
    else
      flash.now[:notice]= "Email doesn't exists" 
    end
  end
  
  #increase order by 1 method
  def increase_order
    @temp = Employee.find_in_batches(batch_size:10) 
    @temp.first.each do |f| 
      f.no_of_order +=1
      f.save
    end 
    redirect_to employees_path(@employee)
  end

  #decrease order by 1 method
  def decrease_order
    @temp = Employee.find_in_batches(batch_size:10) 
    @temp.first.each do |f| 
        f.no_of_order -=1
        f.save
    end 
    redirect_to employees_path(@employee)
  end


  private
  def employee_params
    params.require(:employee).permit(:emp_first_name, :emp_last_name, :email, :age, :no_of_order, :full_time_available, :salary )
  end

end
