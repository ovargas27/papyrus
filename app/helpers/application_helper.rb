module ApplicationHelper
  def current_account
    if user_signed_in?
      @current_account ||= begin
                             account_id = request.env['warden'].user(:scope => :account)
                             Account.find(account_id)
                           end
    end
  end

  def current_user
    if user_signed_in?
      @current_user ||= begin
                             user_id = request.env['warden'].user(:scope => :user)
                             User.find(user_id)
                           end
    end
  end

  def user_signed_in?
    request.env['warden'].authenticated?(:user)
  end
end
