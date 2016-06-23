class CategoriesController < ApplicationController


  def index
    @categories = Category.sorted
  end

  def show
    @category = Category.find(params[:id])
  end



  def new
    @category = Category.new({:category_name => "Default"})

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category has been successfully saved.."
      redirect_to(:action => 'show', :id => @category.id)
    else
      render('new')
    end
  end



  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      # If update succeeds, redirect to the index action
        flash[:notice] = "Category updated successfully!"
        redirect_to(:action => 'show', :id => @category.id)
       elsif
      # If save update, redisplay the form so user can fix problems
        render('edit')
    end
  end



  def delete
    @category = Category.find(params[:id])
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    flash[:notice] = "Category '#{category.category_name}' has been destroyed successfully!"
    redirect_to(:action => 'index')
  end


  private
  def category_params
    params.require(:category).permit(:category_name, :visible)
  end

end
