class EmailLog < ActiveRecord::Base
  attr_accessible :to, :subject, :from, :body

  def text_part
    message.multipart? ? (message.text_part ? message.text_part.body.decoded : nil) : message.body.decoded
  end
end
