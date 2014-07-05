class AddGeneratAtToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :generate_at, :date
  end
end
