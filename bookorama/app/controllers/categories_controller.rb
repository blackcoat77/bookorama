class CategoriesController < ApplicationController

    layout 'admin'

    before_action :confirm_logged_in

    def index
        # @categories = Category.sorted
        @categories = Category.page(params[:page]).per(3)

    end

    def show
        @category = Category.find(params[:id])
    end



    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = 'Category has been successfully saved..'
            redirect_to(action: 'show', id: @category.id)
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
            flash[:notice] = 'Category updated successfully!'
            redirect_to(action: 'show', id: @category.id)
        elsif
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
        redirect_to(action: 'index')
    end




    private

    def category_params
        params.require(:category).permit(:category_name, :visible)
    end
end
