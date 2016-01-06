class Plan < ActiveRecord::Base
  has_many :plan_details, dependent: :destory
end
