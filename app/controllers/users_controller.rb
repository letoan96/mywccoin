class UsersController < ApplicationController

  def login
    render html: "Go to <a href='http://localhost:3000/admin/index' > this </a> for admin login ".html_safe
  end
end
