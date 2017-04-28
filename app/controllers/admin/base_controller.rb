class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  layout "admin"

  private

  def check_admin
    redirect_to root_path, alert: 'Нет прав, ты не админ' unless current_user.admin?
  end

end