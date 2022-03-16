class BooksController < ApplicationController
  def index
  	@book= Book.all
  end
    
  def show
    @book = Book.find(params[:id])
  end
    
  def new 
    @book = Book.new
  end
    
  def create
    puts params
    @book= Book.create(book_params)
    if @book.valid?
      redirect_to books_path(@book)
    else 
      flash[:errors]= @book.errors.full_messages
      render :new
    end
  end
    
  def edit
    @book = Book.find(params[:id])
  end 
    
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path(@book)   
  end
        
  def destroy
    puts params
    @book= Book.find(params[:id])
    @book.destroy
    redirect_to books_path(@book)
  end
    
  private
  def book_params
    params.require(:book).permit(:book_name, :book_price, :author_id)
  end
end
