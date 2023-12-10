class CreateUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :users, id: false do |t|
      t.string :id, null: false
      t.column :first_name, :string, limit: 300
      t.column :last_name, :string, limit: 300
      t.column :email, :string, limit: 300
      t.string :password

      t.timestamps
    end

    add_index :users, :id, unique: true
  end

  def down
    drop_table :users
  end
end
