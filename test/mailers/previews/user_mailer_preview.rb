# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.with(name: "Suzyyyy", mail: "letranthetoan@gmail.com").welcome_email
  end
end
