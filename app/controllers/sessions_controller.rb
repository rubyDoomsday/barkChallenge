# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_forgery_protection

  def new; end

  def create
    user = load_user

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to users_path, notice: "login successful"
    else
      flash.now[:alert] = "invalid email or password"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path, notice: "logged out"
  end

  private

  def load_user
    User.find_by(email: session_params[:email])
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
