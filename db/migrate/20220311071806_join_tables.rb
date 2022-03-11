class JoinTables < ActiveRecord::Migration[7.0]
  def change
    create_join_table :authors, :books, column_options: { null: true }, table_name: :join_tables
  end  
end
