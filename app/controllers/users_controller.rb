class UsersController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User saved."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "User #{@user.name} updated"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "error."
      render('edit')
    end
  end

  def delete
    @user = User.find_by_id(params[:id])
  end

  def destroy
    user = User.find_by_id(params[:id])
    if user.destroy
      flash[:notice] = "User #{user.name} deleted"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Error."
      render('delete')
    end
  end

  private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
    end
end
