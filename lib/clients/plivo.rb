class Clients::Plivo

  def self.perform(notification)
    adapter = notification.adapter
    recipient = notification.recipient

    response = RestClient::Request.new(
      :method => :post,
      :url => "#{adapter.host}/v1/Account/#{adapter.user}/Message/",
      :user => adapter.user,
      :password => adapter.pass,
      :payload => MultiJson.dump({
        :src => adapter.sender,
        :dst => recipient.phone,
        :text => notification.content
      }),
      :headers => {
        :accept => :json,
        :content_type => :json
      }
    ).execute

    return MultiJson.load(response)['api_id']
  end

end
