class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.integer :user_id
      t.boolean :earned, :default => false
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
