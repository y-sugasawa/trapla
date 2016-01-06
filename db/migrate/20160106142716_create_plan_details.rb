class CreatePlanDetails < ActiveRecord::Migration
  def change
    create_table :plan_details do |t|
      t.datetime :started_at
      t.string :place
      t.text :content

      t.timestamps null: false
    end
  end
end
