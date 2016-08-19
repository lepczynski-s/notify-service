# Helper methods defined here can be accessed in any controller or view in the application

module NotifyService
  class App
    module AdaptersHelper

      def available_mail_clients
        {
          'Email via SMTP' => :SmtpEmail,
          'SMS via SMTP' => :SmtpPhone,
          'Mailgun EMAIL API' => :Mailgun,
          'Plivo SMS API' => :Plivo
        }
      end

    end

    helpers AdaptersHelper
  end
end
