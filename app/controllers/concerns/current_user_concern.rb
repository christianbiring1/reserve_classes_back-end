module CurrentUserConcern
  extend ActiveSupport::Concern

  includes do
    before_action :set_current_user
  end

  def set_current_user
    @current_user = User.find(session[:user_id]) if sessions[:user_id]
  end
end
