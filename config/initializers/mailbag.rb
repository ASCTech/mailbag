class MailbagLogger
  def self.delivered_email(message)
    to = message.to.is_a?(Array) ? message.to.join(',') : message.to.to_s
    from = message.from.is_a?(Array) ? message.from.join(',') : message.from.to_s
    text_part = message.multipart? ? (message.text_part ? message.text_part.body.decoded : nil) : message.body.decoded
    EmailLog.create(:to => to, :from => from, :subject => message.subject, :body => text_part)
  end
end

Mail.register_observer(MailbagLogger)
