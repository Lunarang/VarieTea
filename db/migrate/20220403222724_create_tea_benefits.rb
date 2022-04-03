class CreateTeaBenefits < ActiveRecord::Migration[6.1]
  def change
    create_table :tea_benefits do |t|

      t.timestamps
    end
  end
end
