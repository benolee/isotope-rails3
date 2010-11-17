class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update]
  before_filter :require_admin, :only => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration Successful!"
      redirect_to about_path(@user)
    else
      flash[:error] = "There was a problem creating the user."
      render :new
    end
  end

  def index
    @users = User.unlocked
  end

  def show
    @user = User.find_by_slug(params[:id])
    if @user.locked_at?
      redirect_to root_url
    end
    @posts = Post.for_user(@user).paginate :page => params[:page], :order => 'created_at DESC', :per_page => 5
  end

  def edit
    @user = User.find_by_slug(params[:id])
  end

  def update
    @user = User.find_by_slug(params[:id])

    if admin?
      if params[:user]["locked"] == "true" && !@user.locked_at?
        @user.lock_access!
      elsif params[:user]["locked"] == "false" && @user.locked_at?
        @user.unlock_access!
      end
    else
      params[:user]["locked"].delete
    end

    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to about_path(@user)
    else
      flash[:error] = "There was a problem updating the user."
      render :edit
    end
  end
end
