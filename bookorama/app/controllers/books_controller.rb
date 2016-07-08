class BooksController < ApplicationController


    layout 'admin'

    before_action :confirm_logged_in

    def index
        # @books = Book.sorted
        @books = Book.page(params[:page]).per(10)
    end

    def show
        @book = Book.friendly.find(params[:id])
    end




    def new
        @book = Book.new
    end

    def create
        @book = Book.friendly.new(book_params)
        if @book.save
            flash[:notice] = 'The book was created successfully!'
            redirect_to(action: 'show', id: @book.slug)
        else
            render('new')
        end
    end




    def edit
        @book = Book.friendly.find(params[:id])
    end

    def update
        @book = Book.friendly.find(params[:id])

        if @book.update_attributes(book_params)
            flash[:notice] = 'The book was updated successfully!.'
            redirect_to(action: 'show', id: @book.slug)
        else
            render('edit')
        end
    end



    def delete
        @book = Book.friendly.find(params[:id])
    end

    def destroy
        book = Book.friendly.find(params[:id])
        book.destroy
        flash[:notice] = "Book '#{book.title}'destroyed successfully!"
        redirect_to(action: 'index')
    end




    private

    def book_params
        params.require(:book).permit(:category_id, :visible, :isbn, :author, :title, :price, :description, :created_at, :photo, :slug)
    end
end
