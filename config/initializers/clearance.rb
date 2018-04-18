class AdminCheckGuard < Clearance::SignInGuard
  def call
    if !admin?
      failure("Not an Admin!")
    else
      next_guard
    end
  end

  def admin?
    current_user.admin
  end
end


Clearance.configure do |config|
  config.allow_sign_up = true
  config.cookie_domain = ".example.com"
  config.cookie_expiration = lambda { |cookies| 1.year.from_now.utc }
  config.cookie_name = "remember_token"
  config.cookie_path = "/"
  config.routes = false
  config.httponly = false
  config.mailer_sender = "reply@example.com"
  config.password_strategy = Clearance::PasswordStrategies::BCrypt
  config.redirect_url = "/"
  config.rotate_csrf_on_sign_in = false
  config.secure_cookie = false
  config.user_model = User
  config.sign_in_guards = [AdminCheckGuard]
end
