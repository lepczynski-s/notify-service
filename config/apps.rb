##
# This file mounts each app in the Padrino project to a specified sub-uri.
# You can mount additional applications using any of these commands below:
#
#   Padrino.mount('blog').to('/blog')
#   Padrino.mount('blog', :app_class => 'BlogApp').to('/blog')
#   Padrino.mount('blog', :app_file =>  'path/to/blog/app.rb').to('/blog')
#
# You can also map apps to a specified host:
#
#   Padrino.mount('Admin').host('admin.example.org')
#   Padrino.mount('WebSite').host(/.*\.?example.org/)
#   Padrino.mount('Foo').to('/foo').host('bar.example.org')
#
# Note 1: Mounted apps (by default) should be placed into the project root at '/app_name'.
# Note 2: If you use the host matching remember to respect the order of the rules.
#
# By default, this file mounts the primary app which was generated with this project.
# However, the mounted app can be modified as needed:
#
#   Padrino.mount('AppName', :app_file => 'path/to/file', :app_class => 'BlogApp').to('/')
#

Padrino.configure_apps do

  # Enable applications session support
  enable :sessions

  # Application session secret
  set :session_secret, 'e0ea7cc807b750e919c0e7182c9e3f7252e896a8dfeacff9cd36a288b4a12144'

  # Enable rack protection
  set :protection, :except => :path_traversal

  # Enable csrf protection on production (on development it conflicts with better-errors)
  # TODO: Ensure if csrf protection works on production this way!
  set :protect_from_csrf if Padrino.env == :production

end

# Mounts the core application for this project
Padrino.mount('NotifyService::Api', :app_file => Padrino.root('api/app.rb')).to('/api')
Padrino.mount('NotifyService::App', :app_file => Padrino.root('app/app.rb')).to('/administration')
Padrino.mount('NotifyService::Shared', :app_file => Padrino.root('shared/app.rb')).to('/shared')
