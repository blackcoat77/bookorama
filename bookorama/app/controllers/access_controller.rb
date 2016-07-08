class AccessController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    # Display only text and links
  end

  def login
    # Display login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user

      # mark user as logged in
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username

      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'index')
    else
      flash[:warning] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil

    flash[:notice] = "You are logged out"
    redirect_to(:controller => 'public', :action => "index")
  end


end
