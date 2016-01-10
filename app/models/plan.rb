class Plan < ActiveRecord::Base
  has_many :plan_details, dependent: :destroy

  validates :name,  presence: true
  validates :overview,  presence: true
end
