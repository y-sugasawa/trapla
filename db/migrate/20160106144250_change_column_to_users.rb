class ChangeColumnToUsers < ActiveRecord::Migration
  def change
    change_column :users, :name, :string, null: false
    change_column :users, :mail_address, :string, null: false
    change_column :users, :password_md5, :string, null: false
  end
end
