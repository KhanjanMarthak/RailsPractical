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
    @book= Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    end
  end
    
  def edit
    @book = Book.find(params[:id])
  end 
    
  def update
    puts params
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)  
  end
        
  def destroy
    @book= Book.find(params[:id])
    @book.destroy
    redirect_to book_path(@book)
  end
    
  private
  def book_params
    params.require(:book).permit(:book_name, :book_price, :author_id)
  end
end
