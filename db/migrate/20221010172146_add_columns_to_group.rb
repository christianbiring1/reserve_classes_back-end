class AddColumnsToGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :image, :string
    remove_column :groups, :name, :varchar
  end
end
