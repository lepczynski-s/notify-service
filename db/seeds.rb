# Default template

template = Template.create(
  :name => 'Default template',
  :content => <<-TEMPLATE
    <div style="background: #fafafa; padding: 80px 20px; color: #686868;">
      <div style="width: 60%; margin: 0 auto;">
        <h4>Hi, {{ recipient.name }} {{ recipient.surname }}.</h4>
        <table style="width: 100%; background: #ffffff; border: 1px solid #e8e8e8;">
          <tbody>
            <tr>
              <td style="padding: 10px 10px 0;">
                <p>{{ notification.content }}</p>
              </td>
            </tr>
          </tbody>
          <tfoot>
            <tr>
              <td style="padding: 0 10px 10px; color: #a0a0a0; font-size: 12px;">
                <p>Best regards, <a href="http://code-wizards.org">Code-Wizards</a>.</p>
              </td>
            </tr>
          </tfoot>
        </table>
        <p style="font-size: 12px; text-align: center; padding: 10px;">
          If you don't want to receive e-mails, please <a href="%unsubscribe_url%">unsubscribe</a>.
        </p>
      </div>
    </div>
  TEMPLATE
)

# Development adapters

email_adapter = Adapter.create(
  :name => 'Development email adapter',
  :sender => 'Notifications <notifications@code-wizards.tk>',
  :client => 'SmtpEmail',
  :host => 'mail7.mydevil.net',
  :user => 'notifications@code-wizards.tk',
  :pass => 'rEuAMIcEpMKrxJ6jHiLL',
  :port => '587'
)

phone_adapter = Adapter.create(
  :name => 'Development phone adapter',
  :sender => 'SMS <notifications@code-wizards.tk>',
  :client => 'SmtpPhone',
  :host => 'mail7.mydevil.net',
  :user => 'notifications@code-wizards.tk',
  :pass => 'rEuAMIcEpMKrxJ6jHiLL',
  :port => '587'
)

# Developer identity

developer_identity = Identity.create(
  :name => 'Developer',
  :token => 'c763615026968c684378938a1b748f15',
  :secret => '4887dda82e401372479a318ced830739',
  :email_adapter => email_adapter,
  :phone_adapter => phone_adapter
)
