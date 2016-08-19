module NotifyService
  class Api < Padrino::Application

    register Padrino::Helpers
    disable :sessions

    use Rack::Parser, :content_types => {
      'application/json'  => Proc.new { |body| ::MultiJson.load body }
    }

  end
end
