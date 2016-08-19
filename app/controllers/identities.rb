NotifyService::App.controllers :identities do

  get :create do
    @identity = Identity.new
    @adapters_options = Adapter.obtain_available

    @title = title_for :create, :model => ::Identity
    render :create
  end

  post :create do
    @identity = Identity.new
    @adapters_options = Adapter.obtain_available

    @identity.setup params
    @title = title_for :create, :model => ::Identity

    if @identity.valid?
      @identity.save

      flash[:success] = message_for :created, :model => ::Identity
      redirect url_for(:dashboard, :index)
    else
      flash.now[:error] = message_for :failed, :model => ::Identity
      render 'create'
    end
  end

  get :edit, :with => :id do
    @identity = Identity.obtain_from(params) or halt 404
    @adapters_options = Adapter.obtain_available

    @title = title_for :edit, :model => ::Identity
    render 'edit'
  end

  put :edit, :with => :id do
    @identity = Identity.obtain_from(params) or halt 404
    @adapters_options = Adapter.obtain_available

    @identity.setup params
    @title = title_for :edit, :model => ::Identity

    if @identity.valid?
      @identity.save

      flash[:success] = message_for :updated, :model => ::Identity
      redirect url_for(:dashboard, :index)
    else
      flash.now[:error] = message_for :failed, :model => ::Identity
      render 'edit'
    end
  end

end
