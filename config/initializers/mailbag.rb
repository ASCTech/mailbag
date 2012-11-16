class MailbagLogger
  def self.delivered_email(message)
    to = message.to.is_a?(Array) ? message.to.join(',') : message.to.to_s
    from = message.from.is_a?(Array) ? message.from.join(',') : message.from.to_s
    EmailLog.create(:to => to, :from => from, :subject => message.subject, :body => message.body.to_s)
  end
end

Mail.register_observer(MailbagLogger)
