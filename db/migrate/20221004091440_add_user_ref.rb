class AddUserRef < ActiveRecord::Migration[7.0]
  def change
    add_reference :groups, :user, foreign_key: :true
    add_reference :reservations, :group, foreign_key: :true
    add_reference :reservations, :user, foreign_key: :true
  end
end
