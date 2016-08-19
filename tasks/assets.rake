# TODO: Does asset pipeline work on production?
# TODO: Does asset caching work on production?
# TODO: Does asset timestamping work on production?

# task :assets => :environment do
#   sprockets = Sprockets::Environment.new
#
#   sprockets.append_path 'assets/images'
#   sprockets.append_path 'assets/styles'
#   sprockets.append_path 'assets/scripts'
#
#   if defined?(RailsAssets)
#     RailsAssets.load_paths.each do |path|
#       sprockets.append_path path
#     end
#   end
#
#   sprockets.context_class.class_eval do
#     def asset_path(path, options = {})
#       path = environment[path].digest_path
#       "/assets/#{path}"
#     end
#   end
#
#   t.environment = sprockets
#   t.output = './public'
#   t.assets = %w(application.js application.css *.ttf *.woff *.woff2)
# end
