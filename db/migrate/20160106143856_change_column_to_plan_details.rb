class ChangeColumnToPlanDetails < ActiveRecord::Migration
  def change
    change_column :plan_details, :started_at, :datetime, null: false
    change_column :plan_details, :place, :string, null: false
    change_column :plan_details, :content, :text, null: false
    change_column :plan_details, :plan_id, :integer, null: false
  end
end
