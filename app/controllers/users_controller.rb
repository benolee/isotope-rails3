class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update, :index]
  before_filter :require_admin, :only => [:new, :create]

  layout 'subpage'

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration Successful!"
      redirect_to edit_user_path(@user)
    else
      flash[:error] = "There was a problem creating the user."
      render :new
    end
  end

  def index
    @users = User.unlocked
  end

  def show
    @user = User.find(params[:id])
    if @user.locked_at?
      redirect_to root_url
    end
    @posts = Post.for_user(@user).paginate :page => params[:page], :order => 'created_at DESC', :per_page => 5
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if params[:user]["locked"] == "1" && !@user.locked_at?
      @user.lock_access!
    elsif params[:user]["locked"] == "0" && @user.locked_at?
      @user.unlock_access!
    end

    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to root_path
    else
      flash[:error] = "There was a problem updating the user."
      redirect_to root_path
    end
  end
end
