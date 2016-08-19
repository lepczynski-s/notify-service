NotifyService::App.controllers :dashboard, :map => '/' do

  get :index do
    @identities = Identity.obtain_available
    @adapters = Adapter.obtain_available
    @templates = Template.obtain_available
    @title = title_for :dashboard

    render :index
  end

  get :temp2 do
    Template[1].render({
      'recipient' => {
        'name' => Recipient[1].name,
        'surname' => Recipient[1].surname
      },
      'content' => MultiJson.load(Notification[1].content)
    })
  end

end
