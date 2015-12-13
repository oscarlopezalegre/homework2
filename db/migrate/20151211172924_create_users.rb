class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      #needed to enable facebook authentication
      t.string :name
      t.string :provider 
      t.string :uid  
      t.string :oauth_token 
      t.datetime :oauth_expires_at

      #needed to encript the password
      t.string :password_digest

      t.string :email
      t.timestamps null: false
    end
  end
end
