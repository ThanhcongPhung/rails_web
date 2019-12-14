class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
  # You need to implement the method below in your model (e.g. app/models/user.rb)
    generic_callback("twitter")
  
  end
  def generic_callback(provider)
    @identity = User.from_omniauth(request.env["omniauth.auth"])

    @user = @identity || current_user
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end



end