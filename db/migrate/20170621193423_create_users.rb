class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :stage_name
      t.string :email
      t.string :password_digest
      t.boolean :master, default: false
      t.integer :master_id

      t.timestamps
    end
  end
end
