module Api

  class Api::PlansController < ApplicationController
    protect_from_forgery with: :exception
    skip_before_filter :verify_authenticity_token

    def index
      @plans = Plan.all
    end

    def show
      @plan = Plan.find(params[:id])
    end

    def create
      @plan = Plan.new plan_params
      plan_detail_params.each do |detail_param|
        @plan.plan_details.build detail_param
      end
      if @plan.save
        @status = 200
      else
        @status = 400
        @errors = plan.errors.full_messages
      end
    end

    private
    def plan_params
      params.fetch(:plan, {}).permit(:name, :overview)
    end

    def plan_detail_params
      params.fetch(:details, {}).map {|u| u.permit(:started_at, :place, :content)}
    end

  end

end
