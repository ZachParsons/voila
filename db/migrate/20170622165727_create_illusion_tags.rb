class CreateIllusionTags < ActiveRecord::Migration[5.1]
  def change
    create_table :illusion_tags do |t|
      t.references :illusion, null: false
      t.references :tag, null: false

      t.timestamps null: false
    end
  end
end
