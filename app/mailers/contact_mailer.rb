class ContactMailer < ApplicationMailer
  default from: 'example@example.com' # 送信元アドレス
  default to: 'example@example.com'   # 送信先アドレス

  def contact_mail(contact)
    @contact = contact
    mail(subject: 'お問い合わせを承りました', to: ENV.fetch('GMAIL_USERNAME', nil))
  end
end
