NotifyService::Api.controllers  do

  post :index, :with => :type do
    unless ['email', 'phone'].include?(params[:type])
      halt 404, 'Invalid notification type.'
    end
    unless identity = identify(params)
      halt 401, 'Invalid identity.'
    end
    unless authorized?(identity, params)
      halt 401, 'Invalid authorization.'
    end
    unless adapter = ensure_adapter(identity, params)
      halt 500, 'Invalid adapter.'
    end
    unless recipient = ensure_recipient(params)
      halt 422, 'Invalid recipient.'
    end
    unless notification = create_notification(adapter, recipient, params)
      halt 422, 'Invalid notification.'
    else
      halt 201, 'Notification enqueued.'
    end
  end

end
