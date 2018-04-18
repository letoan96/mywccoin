class Clearance::SessionsController < Clearance::BaseController
	def new
		if current_user && current_user.admin
			redirect_to admin_index_path 
		else
			render 'sessions/new'
		end
	end

	def create
    @user = authenticate(params)
    sign_in(@user) do |status|
    	if status.success?
	    	redirect_signed_in_users
      else
        flash.now.notice = status.failure_message
        render template: "sessions/new", status: :unauthorized
      end
    end
  end

  def destroy
    sign_out
    redirect_to url_after_destroy
  end

  private

  def redirect_signed_in_users
    if signed_in?
      redirect_to url_for_signed_in_users
    end
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def url_after_destroy
    admin_login_path
  end

  def url_for_signed_in_users
    admin_index_path
  end

end
