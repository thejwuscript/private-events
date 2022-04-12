class Users::SessionsController < Devise::SessionsController
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    flash[:notice] = "You have signed out."
    respond_to_on_destroy
  end

  private

  def respond_to_on_destroy
    respond_to do |format|
      format.all { redirect_to root_path, status: :see_other}
    end
  end
end