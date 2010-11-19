class HomeController < ApplicationController

  def index
    render :layout => 'homepage'
    tab :home
  end

  def contact
    tab :contact
    if request.post?
      if @contact_form = Contact.create(params[:user])
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
