NotifyService::App.controllers :templates do

  get :create do
    @template = Template.new

    @title = title_for :create, :model => ::Template
    render :create
  end

  post :create do
    @template = Template.new

    @template.setup params
    @title = title_for :create, :model => ::Template

    if @template.valid?
      @template.save

      flash[:success] = message_for :created, :model => ::Template
      redirect url_for(:dashboard, :index)
    else
      flash.now[:error] = message_for :failed, :model => ::Template
      render :create
    end
  end

  get :edit, :with => :id do
    @template = Template.obtain_from(params) or halt 404

    @title = title_for :edit, :model => ::Template
    render :edit
  end

  put :edit, :with => :id do
    @template = Template.obtain_from(params) or halt 404

    @template.setup params
    @title = title_for :edit, :model => ::Template

    if @template.valid?
      @template.save

      flash[:success] = message_for :updated, :model => ::Template
      redirect url_for(:dashboard, :index)
    else
      flash.now[:error] = message_for :failed, :model => ::Template
      render :edit
    end
  end

end
