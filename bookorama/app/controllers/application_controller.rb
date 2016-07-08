class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :search

  def search
    @q = Book.ransack(params[:q])
    @results = @q.result(distinct: true).page(params[:page])
  end


  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:warning] = "Please log in"
      redirect_to(:controller => 'access', :action => 'login')
      return false  # Halts before_action
    else
      return true
    end

  end


end
