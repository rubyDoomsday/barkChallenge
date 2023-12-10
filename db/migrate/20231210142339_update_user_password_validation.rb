class UpdateUserPasswordValidation < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :password_digest, :string
    add_column :users, :password_confirmation, :string
  end

  def down
    remove_column :users, :password_digest
    add_column :users, :password_confirmation, :string
  end
end

