class UserMailer < ActionMailer::Base
  default from: "alessandro@alessandrostein.com"

  #layout 'awesome'

  def welcome_email(user)
    @user = user
    mail(to: @user.email,
      subject: "Already rendered!")
  end

  def receive(email)
    page = Page.find_by(address: email.to.first)
    page.emails.create(
      subject: email.subject,
      body: email.body
    )

    if email.has_attachments?
      email.attachments.each do |attachment|
        page.attachments.create({
          file: attachment,
          description: email.subject
        })
      end
    end
  end
end
