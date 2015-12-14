class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :friend1_id
      t.integer :friend2_id
      t.boolean :block, default: false 
      t.timestamps null: false
    end
  end
end
