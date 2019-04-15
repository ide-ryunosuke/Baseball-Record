class Users::SessionsController < Devise::SessionsController

  def new
    @user = User.new
  end

  def destroy
    super
    session[:keep_signed_out] = true
  end
end
