class AddGeneratAtToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :generate_at, :date
  end
end
