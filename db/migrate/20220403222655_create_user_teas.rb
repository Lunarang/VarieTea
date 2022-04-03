class CreateUserTeas < ActiveRecord::Migration[6.1]
  def change
    create_table :user_teas do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :tea, null: false, index: true, foreign_key: true
      t.boolean :tasted, :default => false
      t.boolean :favorite, :default => false

      t.timestamps
    end
  end
end
