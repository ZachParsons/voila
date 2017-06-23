class AddApprovalToIllusions < ActiveRecord::Migration[5.1]
  def change
    add_column :illusions, :approval, :boolean, default: false
  end
end
