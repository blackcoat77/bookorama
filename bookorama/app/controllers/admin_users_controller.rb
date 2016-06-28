class AdminUsersController < ApplicationController

  layout 'admin'
  before_action :confirm_logged_in


  def index
    # @admin_users = AdminUser.sorted
    @admin_users = AdminUser.sorted.page(params[:page]).per(3)

  end



  def new
    @admin_user = AdminUser.new
  end
  def create
       @admin_user = AdminUser.new(administrator_users_parameters)
    if @admin_user.save
       flash[:notice] = "The user was successfully created"
       redirect_to(:controller => 'admin_users', :action => 'index')
    else
      render('new')
    end
  end




  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(administrator_users_parameters)
       flash[:notice] = "Admin User updated successfully."
       redirect_to(:action => 'index')
    else
      render('edit')
    end
  end



  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    AdminUser.find(params[:id]).destroy
    flash[:notice] = "Admin user destroyed."
    redirect_to(:action => 'index')
  end


  private

  def administrator_users_parameters
    params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password, :photo, :created_at, :updated_at)
  end
end
