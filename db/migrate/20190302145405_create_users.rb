class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string :name,     default: '', null: false
      t.string :id_name,  default: '', null: false
    end

    add_index :users, :id_name, unique: true
  end

  def down
    drop_table :users
  end
end
