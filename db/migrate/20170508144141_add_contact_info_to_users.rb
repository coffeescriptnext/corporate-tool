class AddContactInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :slack_username, :string
    add_column :users, :github_username, :string
  end
end
