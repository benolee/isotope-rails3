class ContactMailer < ActionMailer::Base
  default :from => "contact@isotope11.com"

  def contact_email(contact_form)
    @contact_form = contact_form
    mail(
      :to => ["josh@isotope11.com", "laird@isotope11.com"]
      :subject => "Somebody used the contact form!"
    )
  end
end
