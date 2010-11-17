class ContactMailer < ActionMailer::Base
  default :from => "do_not_reply@isotope11.com"

  def contact_email(contact_form)
    @contact_form = contact_form
    mail(
      :to => "info@isotope11.com",
      :subject => "[WEBSITE] Contact Form"
    )
  end
end
