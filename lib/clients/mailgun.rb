class Clients::Mailgun

  def self.perform(notification)
    adapter = notification.adapter
    recipient = notification.recipient

    response = RestClient::Request.new(
      :method => :post,
      :url => "#{adapter.host}/v3/#{adapter.user}/messages",
      :user => 'api',
      :password => adapter.pass,
      :payload => {
        :from => adapter.sender,
        :to => recipient.email,
        :subject => notification.subject,
        :text => notification.content,
        :html => "<h1>#{notification.content}</h1>"
      },
      :headers => {
        :accept => :json,
        :content_type => :json
      }
    ).execute

    return MultiJson.load(response)['id']
  end

end
