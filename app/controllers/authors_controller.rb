class AuthorsController < ApplicationController
  
  def index
    @author= Author.all
  end

  def show
    @author = Author.find(params[:id])
  end
    
  def new
    @author = Author.new
  end

  def create
    @author= Author.create(author_params)
    if @author.valid?
      redirect_to authors_path(@author)
    else 
      flash[:errors]= @author.errors.full_messages
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end 

  def update
    puts params
    @author= Author.find(params[:id])
    @author.update(author_params)
    redirect_to authors_path(@author)  
  end
    
  def destroy
    @author= Author.find(params[:id])
    @author.destroy
    redirect_to authors_path(@author)
  end
  
  private
  def author_params
    params.require(:author).permit(:first_name, :last_name, :dob, :email)
  end

end
