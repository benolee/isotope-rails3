class ContactMailer < ActionMailer::Base
  default :from => "from@example.com"

  def contact_email(contact_form)
    @contact_form = contact_form
    mail(
      :to => "bradley@isotope11.com",
      :subject => "Somebody used the contact form!"
    )
  end
end
