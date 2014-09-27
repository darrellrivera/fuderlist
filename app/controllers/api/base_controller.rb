class Api::BaseController < ApplicationController
  before_filter :require_internal_api_key

  protected

  def api_key
    @api_key ||= ApiKey.new(request.headers['X-Fuderlist-API-Key'])
  end

  def require_internal_api_key
    head(:unauthorized) unless api_key.valid?
  end
end