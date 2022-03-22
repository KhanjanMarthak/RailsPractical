class StudentsController < ApplicationController
  
  def index
    @student= Student.all
  end

  def show
    @student = Student.find(params[:id])
  end
    
  def new
    @student = Student.new
  end

  def create
    @student= Student.new(student_params)
    @student.department = student_params[:department].upcase
    @student.save
    if @student.valid?
      redirect_to students_path(@student)
    else 
      flash.now[:errors]= @student.errors.full_messages
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end 

  def update
    puts params
    @student= Student.find(params[:id])
    @student.update(student_params)
    if @student.valid?
      redirect_to students_path(@student)
    else 
      flash.now[:errors]= @student.errors.full_messages
      render :new
    end  
  end
    
  def destroy
    @student= Student.find(params[:id])
    @student.destroy
    redirect_to students_path(@student)
  end
  
  private
  def student_params
    params.require(:student).permit(:stud_first_name, :stud_last_name, :stud_dob, :department, :term_of_service )
  end
  
end
