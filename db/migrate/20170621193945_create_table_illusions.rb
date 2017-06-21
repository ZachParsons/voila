class CreateTableIllusions < ActiveRecord::Migration[5.1]
  def change
    create_table :table_illusions do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.boolean :intense, default: false
      t.integer :creator_id, null: false
      t.timestamps(null: false)
    end
  end
end
