class AddProfileTextToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_texit, :text
  end
end
