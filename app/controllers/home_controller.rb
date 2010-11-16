class HomeController < ApplicationController
  layout 'subpage'

  def index
    render :layout => 'application'
    tab :home
  end

  def about
    @users = User.all
    tab :about
  end

  def clients
  end

  def contact
    tab :contact
    if request.post?
      if @contact_form = ContactForm.create(params[:user])
        ContactMailer.contact_email(@contact_form).deliver
        flash.now[:notice] = "Email sent successfully."
      else
        flash.now[:error] = "There was a problem sending the email"
      end
    end
  end

  def payments
    tab :payments
  end

  def services
    tab :services
  end

  def careers
  end

end

