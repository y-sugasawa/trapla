class AddPlanIdToPlanDetails < ActiveRecord::Migration
  def change
    add_column :plan_details, :plan_id, :integer
  end
end
