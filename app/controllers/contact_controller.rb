class ContactController < ApplicationController
  before_filter :require_admin, :only => [:show, :edit]

  def index
    if current_user && current_user.admin?
      @contacts = Contact.all
    else
      @contact = Contact.new
    end
  end

  def show
      @contact = Contact.find(params[:id])
  end

  def create
    if @contact = Contact.create(params[:contact])
      flash[:notice] = "Message successfully sent."
      redirect_to :action => 'index'
    else
      flash[:error] = "There were problems sending the message."
      redirect_to :action => 'index'
    end
  end

  def edit
      @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:notice] = "Message was successfully updated."
      redirect_to :action => 'index'
    else
      flash[:error] = "There was a problem updating the message."
      redirect_to :action => 'index'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      flash[:notice] = "Message was successfully deleted."
      redirect_to :action => 'index'
    else
      flash[:error] = "There was a problem deleting the message."
      redirect_to :action => 'index'
    end
  end

end
