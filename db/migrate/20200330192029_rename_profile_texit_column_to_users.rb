class RenameProfileTexitColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :profile_texit, :profile_text
  end
end
