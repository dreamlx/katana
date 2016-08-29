class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
  @accounts_user = User.new
  end

  # POST /resource/sign_in
  def create
    @accounts_user = User.find_by(email: params[:accounts_user][:email])
    if @accounts_user && @accounts_user.valid_password?(params[:accounts_user][:password])
      sign_in(@accounts_user, bypass: true)
      redirect_to admin_root_path
    else
      flash.now[:danger] = 'invalid_email_or_password'
      render 'new'
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
