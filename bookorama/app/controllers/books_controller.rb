class BooksController < ApplicationController


  def index
    @books = Book.sorted
  end

  def show
    @book = Book.find(params[:id])
  end


  def new
    @book = Book.new
    @categories = Category.order('category_name ASC')
  end

  def create

    @book = Book.new(book_params)
    if @book.save
      redirect_to(:action => 'index')
      flash[:notice] = "The book  was created successfully"
     else
       render 'new', notice: "Oh no, please get back and solve this errror!"
    end
  end




  def edit
    @book = Book.find(params[:id])
    @categories = Category.order('category_name ASC')
  end

  def update
    if @book.update_attributes(book_params)
        redirect_to(:action => 'show', :id => @book.id)
        flash[:notice] = "The book was update successfully"
    else
      @categories = Category.order('category_name ASC')
      render('edit')
    end
  end




  def delete
    @book = Book.find(params[:id])
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book '#{book.title}'destroyed successfully!"
    redirect_to(:action => 'index')
  end



  private
  def book_params
    params.require(:book).permit(:category_id, :isbn, :author, :title, :price, :description)
  end


end
