class HealthController < ApplicationController
  def live = render(json:{status:'ok'})
  def ready
    RedirectEntry.limit(1).pluck(:id)
    render json:{status:'ready'}
  rescue ActiveRecord::ActiveRecordError
    render json:{error:'database_unavailable'},status: :service_unavailable
  end
end
