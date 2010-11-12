class UsersController < ApplicationController
  layout 'subpage'

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration Successful!"
      redirect_to root_url
    else
      render :action => :new
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
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to root_path
    else
      render :action => :edit
    end
  end
end
