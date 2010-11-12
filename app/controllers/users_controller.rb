class UsersController < ApplicationController
  layout 'subpage'

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration Successful!"
      redirect_to root_path
    else
      flash[:error] = "There was a problem creating the user."
      redirect_to root_path
    end
  end

  def index
    @users = User.find(:all)
  end

  def show
    @user = User.find(params[:id])
    @users = User.find(:all)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to root_path
    else
      flash[:error] = "There was a problem updating the user."
      redirect_to root_path
    end
  end
end
