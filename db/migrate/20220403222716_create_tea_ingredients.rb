class CreateTeaIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :tea_ingredients do |t|

      t.timestamps
    end
  end
end
