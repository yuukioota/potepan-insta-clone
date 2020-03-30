class AddWebSiteUrlToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :website_url, :text
  end
end
