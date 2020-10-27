class AddUserIdToProject < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :user, index: true
  end
end
