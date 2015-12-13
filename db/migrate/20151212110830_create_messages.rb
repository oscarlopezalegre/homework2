class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.integer :sender_id
      t.integer :recipient_id    
      t.boolean :read
      t.timestamp :read_time      
      t.timestamps null: false
    end
  end
end
