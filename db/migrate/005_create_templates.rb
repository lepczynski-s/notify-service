Sequel.migration do
  up do
    create_table :templates do
      primary_key :id

      String :name, :size => 32, :null => false, :unique => true
      String :content, :text => true, :size => 8192, :null => false

      DateTime :updated_at, :null => false
      DateTime :created_at, :null => false
    end
  end

  down do
    drop_table :templates
  end
end
