class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :record_request


  def record_request
    @page = params[:page] ||= 1
    @page_size = params[:pageSize] ||= 10
  end
end