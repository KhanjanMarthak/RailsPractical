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
    @student= Student.create(student_params)
    if @student.valid?
      redirect_to students_path(@student)
    else 
      flash[:errors]= @student.errors.full_messages
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
    redirect_to students_path(@student)  
  end
    
  def destroy
    @student= Student.find(params[:id])
    @student.destroy
    redirect_to students_path(@student)
  end
  
  private
  def student_params
    params.require(:student).permit(:stud_first_name, :stud_last_name, :stud_dob, :term_of_service )
  end
end
