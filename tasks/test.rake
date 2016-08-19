require 'rubygems'

begin

  require 'cucumber'
  require 'cucumber/rake/task'

  desc 'Prepare testing environement'
  namespace :test do
    task :prepare do
      ENV['RACK_ENV'] = 'test'
    end
  end

  Cucumber::Rake::Task.new :test => ['test:prepare', 'db:reset'] do |t|
    t.cucumber_opts = 'features --format pretty'
  end

rescue LoadError

  desc 'Cucumber is not available'
  task :test do
    abort 'Cucumber rake task is not available.'
  end

end
