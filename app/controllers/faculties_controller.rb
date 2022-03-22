class FacultiesController < ApplicationController

  def index
    @faculty= Faculty.all
  end

  def show
    @faculty = Faculty.find(params[:id])
  end
    
  def new
    @faculty = Faculty.new
  end

  def create
    @faculty= Faculty.new(faculty_params)
    if @faculty.valid?
      @faculty.save
      redirect_to faculties_path(@faculty)
    else 
      flash[:errors]= @faculty.errors.full_messages
      render :new
    end
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end 

  def update
    puts params
    @faculty= Faculty.find(params[:id])
    @faculty.update(faculty_params)
    redirect_to faculties_path(@faculty)  
  end
    
  def destroy
    @faculty= Faculty.find(params[:id])
    @faculty.destroy
    redirect_to faculties_path(@faculty)
  end
  
  private
  def faculty_params
    params.require(:faculty).permit(:fac_first_name, :fac_last_name, :fac_dob, :email, :phone_number, :designation )
  end

end
