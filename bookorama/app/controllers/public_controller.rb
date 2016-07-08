class PublicController < ApplicationController

  layout 'public'

  before_action :setup_navigation

  def index

  end


  def show
    @book = Book.where(:slug => params[:slug], :visible => true).first
    if @book.nil?
      redirect_to(:action => 'index')
    else
      # Display the book content using show.html.erb
    end
  end


  def cat
    @category = Category.where(:slug => params[:slug], :visible => true).first
    @books = @category.books.sorted

    if @category.nil?
      redirect_to(:action => 'index')
    else
        # Display the categories content using cat.html.erb
    end
  end




  private

  def setup_navigation
    @categories = Category.visible
  end

end
