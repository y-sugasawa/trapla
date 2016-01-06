class ChangeColumnToPlans < ActiveRecord::Migration
  def change
    change_column :plans, :name, :string, null: false
    change_column :plans, :overview, :text, null: false
  end
end
