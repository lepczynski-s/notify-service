Sequel.migration do
  up do
    create_table :recipients do
      primary_key :id

      String :email, :size => 64, :unique => true, :null => false
      String :phone, :size => 32

      String :name, :size => 128, :null => false
      String :surname, :size => 128, :null => false

      DateTime :updated_at, :null => false
      DateTime :created_at, :null => false
    end
  end

  down do
    drop_table :recipients
  end
end
