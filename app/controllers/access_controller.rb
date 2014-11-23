class AccessController < ApplicationController

    layout 'admin'


    before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    #display text and index
  end

  def login
    #login form
  end

  def attempt_login
    #try to find the user and authenticate him
    if params[:username].present? && params[:password].present?
        found_user = User.where(:username => params[:username]).first
        if found_user
            authorized_user = found_user.authenticate(params[:password])
        end
    end

    #if the user is authenticate, mark user as logged in
    if authorized_user
        session[:user_id] = authorized_user.id
        session[:username] = authorized_user.username
        flash[:notice] = "You are logged in."
        redirect_to(:action => 'index')
    else
        flash[:notice] = "Invalid username/password."
        redirect_to(:action => 'login')
    end

  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "You are logged out."
    redirect_to(:action => 'login')
  end


end
