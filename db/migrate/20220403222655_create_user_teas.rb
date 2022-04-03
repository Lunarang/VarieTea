class CreateUserTeas < ActiveRecord::Migration[6.1]
  def change
    create_table :user_teas do |t|

      t.timestamps
    end
  end
end
