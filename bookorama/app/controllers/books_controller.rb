class BooksController < ApplicationController


    layout "admin"

    def index
        # @books = Book.sorted
        @books = Book.page(params[:page]).per(3)
    end

    def show
        @book = Book.find(params[:id])
    end




    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            flash[:notice] = 'The book was created successfully!'
            redirect_to(action: 'show', id: @book.id)
        else
            render('new')
        end
    end




    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])

        if @book.update_attributes(book_params)
            flash[:notice] = 'The book was updated successfully!.'
            redirect_to(action: 'show', id: @book.id)
        else
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
        redirect_to(action: 'index')
    end




    private

    def book_params
        params.require(:book).permit(:category_id, :visible, :isbn, :author, :title, :price, :description, :creat_at, :photo)
    end
end
