module NotifyService
  class Shared < Padrino::Application
    disable :protect_from_csrf

    def initialize
      @sprockets = Sprockets::Environment.new
      @sprockets.append_path 'shared/assets/images'
      @sprockets.append_path 'shared/assets/styles'
      @sprockets.append_path 'shared/assets/scripts'

      if defined?(RailsAssets)
        RailsAssets.load_paths.each do |path|
          @sprockets.append_path path
        end
      end

      @sprockets.context_class.class_eval do
        def asset_path(path, options = {})
          "/shared/#{path}"
        end
      end
    end

    def call(*args)
      @sprockets.call(*args)
    end

    def self.root
      Padrino.root('public')
    end

    def self.call(*args)
      NotifyService::Shared.new.call(*args)
    end
  end
end
