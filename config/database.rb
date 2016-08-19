# Sequel plugins
Sequel::Model.plugin :schema
Sequel::Model.plugin :validation_helpers
Sequel::Model.plugin :timestamps, :update_on_create => true

# Sequel configuration
Sequel::Model.db = case Padrino.env

  # Production database
  # TODO: Production database configuration.
  when :production then Sequel.connect("mysql2://localhost/notify", :loggers => [logger])

  # Development database
  when :development then Sequel.connect("mysql2://cw:password@localhost/notify", :loggers => [logger])

  # Tests database
  when :test then Sequel.connect("sqlite://db/database.db", :loggers => [logger])

end
