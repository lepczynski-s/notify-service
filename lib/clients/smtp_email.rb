module Clients
  class SmtpEmail

    def self.perform(notification)
      adapter = notification.adapter
      recipient = notification.recipient

      mail = Mail.deliver do
        to recipient.email
        from adapter.sender
        subject notification.subject

        delivery_method(
          :smtp,
          :address => adapter.host,
          :port => adapter.port,
          :user_name => adapter.user,
          :password => adapter.pass,
          :authentication => 'plain',
          :enable_starttls_auto => true
        )

        text_part do
          body notification.content
        end

        html_part do
          content_type 'text/html; charset=UTF-8'
          body Template[1].render(recipient, notification)
        end
      end

      nil
    end

  end
end
