module UsersHelper
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to login_url, notice: "Please sign in."
    end
  end

  def redirect_signed_in_user
    unless signed_in?
      redirect_to root_url, notice: "Please sign in."
    end
  end

  def redirect_signed_in_user_from_signin
    redirect_to user_url(current_user) if signed_in?
  end
end
