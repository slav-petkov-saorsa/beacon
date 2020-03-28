class AddAuthDetailsToUsers < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def change
    add_column :users, :email, :string
    add_index :users, :email, unique: true, algorithm: :concurrently
    add_column :users, :provider, :string
  end
end
