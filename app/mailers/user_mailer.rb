class UserMailer < ActionMailer::Base
  default from: "leah@lofirefly.com"

  def email(subject, body, user)
    @body = body
    @user = user
    mail(to: @user.email, subject: subject)
  end
end
