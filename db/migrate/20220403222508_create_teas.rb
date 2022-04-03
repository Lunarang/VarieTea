class CreateTeas < ActiveRecord::Migration[6.1]
  def change
    create_table :teas do |t|
      t.string :name
      t.text :preparation

      # Teas can be created by Users, but not all Teas belong to a User (ie the pre-existing teas)
      # Value may be null
      t.integer :user_id
      
      t.timestamps
    end
  end
end
