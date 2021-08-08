class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail(
      from: ENV['SEND_MAIL'],  # 送信元アドレス
      to: contact.email,       # 送信先アドレス
      subject: 'お問い合わせを承りました', # メールの件名
      bcc: ENV['SEND_MAIL']    # BCC送信先アドレス
    )
  end
end
