class UsersBackofficeController < ApplicationController
  before_action :authenticate_user!, :build_profile
  layout "users_backoffice"

  private

  def build_profile
    current_user.build_user_profile if current_user.user_profile.blank?
  end

end
