NotifyService::App.controllers :adapters do

  get :create do
    @adapter = Adapter.new
    @mail_clients_options = available_mail_clients

    @title = title_for :create, :model => ::Adapter
    render :create
  end

  post :create do
    @adapter = Adapter.new
    @mail_clients_options = available_mail_clients

    @adapter.setup params
    @title = title_for :create, :model => ::Adapter

    if @adapter.valid?
      @adapter.save

      flash[:success] = message_for :created, :model => ::Adapter
      redirect url_for(:dashboard, :index)
    else
      flash.now[:error] = message_for :failed, :model => ::Adapter
      render :create
    end
  end

  get :edit, :with => :id do
    @adapter = Adapter.obtain_from(params) or halt 404
    @mail_clients_options = available_mail_clients

    @title = title_for :edit, :model => ::Adapter
    render :edit
  end

  put :edit, :with => :id do
    @adapter = Adapter.obtain_from(params) or halt 404
    @mail_clients_options = available_mail_clients

    @adapter.setup params
    @title = title_for :edit, :model => ::Adapter

    if @adapter.valid?
      @adapter.save

      flash[:success] = message_for :updated, :model => ::Adapter
      redirect url_for(:dashboard, :index)
    else
      flash.now[:error] = message_for :failed, :model => ::Adapter
      render :edit
    end
  end

end
