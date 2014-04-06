class ContactMailer < ActionMailer::Base
  default from: "contact@lofirefly.com"

  def send_form(contact)
    @contact = contact
    mail(:subject => "Firefly Contact",
	  	   :to      => "leah@lofirefly.com",
	  	   :bcc     => "matthew.j.oconnell1@gmail.com",
	  	   :from    => "#{@contact.email}")
  end
end
