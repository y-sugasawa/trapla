class PlanDetail < ActiveRecord::Base
  belongs_to :plan

  validates :started_at,  presence: true
  validates :place,  presence: true
  validates :content,  presence: true
end
