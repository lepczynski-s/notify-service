Sequel.migration do
  up do
    create_table :adapters do
      primary_key :id

      String :name, :size => 32, :null => false, :unique => true
      String :sender, :size => 64, :null => false

      String :client, :size => 16, :null => false
      String :host, :size => 64, :null => false
      String :user, :size => 64, :null => false
      String :pass, :size => 64, :null => false
      String :port, :size => 64

      DateTime :updated_at, :null => false
      DateTime :created_at, :null => false
    end

    alter_table :identities do
      add_foreign_key :email_adapter_id, :adapters, :null => false
      add_foreign_key :phone_adapter_id, :adapters, :null => false
    end
  end

  down do
    alter_table :identities do
      remove_foreign_key :email_adapter_id
      remove_foreign_key :phone_adapter_id
    end

    drop_table :adapters
  end
end
