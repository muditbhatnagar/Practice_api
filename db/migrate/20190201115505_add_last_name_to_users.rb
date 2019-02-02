class AddLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :country, :string
    add_column :users, :phone_number, :string
    add_column :users, :age, :integer
    add_column :users, :date_of_birth, :string
    add_column :users, :height, :string
    add_column :users, :role, :string
  end
end
