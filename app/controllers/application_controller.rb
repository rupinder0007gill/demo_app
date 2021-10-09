# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, alert: 'Access denied. You are not authorized to access the requested page.'
  end
end
