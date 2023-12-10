# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_login, except: %i[new create]

  def new
    user = User.new
    render :new, locals: { user: user }
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      redirect_to users_path, notice: "Registration successful!"
    else
      render :new, locals: { user: user }, notice: "registration failed"
    end
  end

  def edit
    user = load_user
    if user.nil?
      redirect_to users_path, notice: "user not found"
    else
      render :edit, locals: { user: user }
    end
  end

  def update
    user = load_user
    if user.update_attr(edit_user_params)
      render :show, locals: { user: user }, notice: "update complete"
    else
      render :edit, locals: { user: user }, notice: "registration failed"
    end
  end

  def index
    users = User.all
    render :index, locals: { users: users }
  end

  def show
    user = load_user
    if user.nil?
      redirect_to users_path, notice: "user not found"
    else
      render :show, locals: { user: user }
    end
  end

  private

  def load_user
    User.find_by(id: params[:id])
  end

  def edit_user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :current_password)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
