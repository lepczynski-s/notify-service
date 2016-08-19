Sequel.migration do
  up do
    create_table :identities do
      primary_key :id

      String :name, :size => 32, :null => false, :unique => true
      String :token, :size => 32, :null => false, :unique => true
      String :secret, :size => 32, :null => false, :unique => true

      DateTime :updated_at, :null => false
      DateTime :created_at, :null => false
    end
  end

  down do
    drop_table :identities
  end
end
