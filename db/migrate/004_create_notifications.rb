Sequel.migration do
  up do
    create_table :notifications do
      primary_key :id

      foreign_key :adapter_id, :adapters, :null => false
      foreign_key :recipient_id, :recipients, :null => false
      String :external_id, :size => 128

      String :subject, :size => 64, :null => false
      String :content, :text => true, :size => 4096, :null => false

      DateTime :sent_at
      DateTime :digest_for
      DateTime :schedule_for

      DateTime :updated_at, :null => false
      DateTime :created_at, :null => false
    end
  end

  down do
    drop_table :notifications
  end
end
