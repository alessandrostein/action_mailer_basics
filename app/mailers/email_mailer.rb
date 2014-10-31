class EmailMailer < ActionMailer::Base
  default from: "alessandro@alessandrostein.com"

  layout 'application'

  def welcome_email(email)
    @email = email
    @url = 'www.alessandrostein.com'
    mail(to: @email.to, subject: @email.subject)
  end

  def welcome_attachments(email)
    attachments.inline['image.jpg'] = File.read('/home/alessandrostein/Imagens/download.jpg')

    @email = email
    @url = 'www.alessandrostein.com'
    mail(to: @email.to, subject: @email.subject)
  end

  def welcome_template(email)
    @email = email
    @url = 'www.alessandrostein.com'
    mail(to: @email.to,
         subject: @email.subject,
         template_path: 'layouts',
         template_name: 'application')
  end

  def protect_against_forgery?
      false
  end

end
