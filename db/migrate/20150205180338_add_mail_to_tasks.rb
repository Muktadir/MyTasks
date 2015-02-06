class AddMailToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :email, :string
    add_column :tasks, :deadline, :string
  end
end
