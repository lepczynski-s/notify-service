# Helper methods defined here can be accessed in any controller or view in the application

module NotifyService
  class Api
    module Helpers

      def identify(params)
        Identity.first :token => params['authorization']['token']
      end

      def authorized?(identity, params)
        ::Utils::TokenProcessor.compare identity[:secret], params['authorization']['secret']
      end

      def ensure_adapter(identity, params)
        identity.public_send "#{params[:type]}_adapter" if identity.respond_to? "#{params[:type]}_adapter"
      end

      def ensure_recipient(params)
        recipient = (Recipient.first :email => params['recipient']['email'] or Recipient.new)
        recipient.setup params
        recipient.save if recipient.valid?
      end

      def create_notification(adapter, recipient, params)
        notification = Notification.new
        notification.setup params
        notification.adapter = adapter
        notification.recipient = recipient
        notification.save if notification.valid?
      end

    end

    helpers Helpers
  end
end
