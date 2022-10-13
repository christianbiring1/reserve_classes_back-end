class RemoveColumnFromGroup < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :name, :varchar
  end
end
