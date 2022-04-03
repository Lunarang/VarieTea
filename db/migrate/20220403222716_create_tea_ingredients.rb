class CreateTeaIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :tea_ingredients do |t|
      t.references :tea, null: false, index: true, foreign_key: true
      t.references :ingredient, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
