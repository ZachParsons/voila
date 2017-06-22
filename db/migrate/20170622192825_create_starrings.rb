class CreateStarrings < ActiveRecord::Migration[5.1]
  def change
    create_table :starrings do |t|
      t.integer :illusion_id
      t.integer :starrer_id
      t.timestamps
    end
  end
end
