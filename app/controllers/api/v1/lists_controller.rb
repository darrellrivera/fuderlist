class Api::V1::ListsController < Api::BaseController
  def index
    render :json => List.all
  end
end
