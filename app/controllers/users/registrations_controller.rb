class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  # PUT /users/update_profile
  def update_profile
    user = current_user

    # Verify current password before updating
    if user.valid_password?(user_params[:current_password])
      if user.update(user_params.except(:current_password))
        bypass_sign_in(user) # Keeps the user signed in after changing the password
        flash[:notice] = "Profile updated successfully"
        redirect_to edit_profile_path
      else
        flash[:alert] = "There was an error updating your profile"
        render :edit_profile
      end
    else
      flash[:alert] = "Current password is incorrect"
      render :edit_profile
    end
  end

  private

  def user_params
    # Permit the necessary attributes for password update, excluding :current_password from direct update
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
