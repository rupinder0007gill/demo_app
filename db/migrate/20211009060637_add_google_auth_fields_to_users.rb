# frozen_string_literal: true

class AddGoogleAuthFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :token, :string
    add_column :users, :uid, :string
    add_column :users, :refresh_token, :string
    add_column :users, :provider, :string
  end
end
