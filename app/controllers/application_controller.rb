class ApplicationController < ActionController::API
  rescue_from ActiveRecord::StatementInvalid do
    render json:{error:'database_unavailable'},status: :service_unavailable
  end
  rescue_from Problem do |e|
    render json:{error:e.message},status:e.status
  end
  rescue_from ActiveRecord::RecordNotFound do
    render json:{error:'not_found'},status: :not_found
  end
  rescue_from ActiveRecord::RecordNotUnique do
    render json:{error:'duplicate'},status: :conflict
  end
  rescue_from ActiveRecord::InvalidForeignKey,ActiveRecord::RecordInvalid do
    render json:{error:'invalid_relationship_or_record'},status: :bad_request
  end
  def authenticate
    token=ENV['API_TOKEN'];header=request.headers['Authorization'].to_s
    raise Problem.new(503,'token_unconfigured') if token.nil?||token.empty?
    unless header.start_with?('Bearer ')&&ActiveSupport::SecurityUtils.secure_compare(header.delete_prefix('Bearer '),token)
      raise Problem.new(401,'unauthorized')
    end
  end
end
