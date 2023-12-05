class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{name}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params.except(:password, :password_confirmation))
    if valid_user?
      @user.password = user_params[:password]
      if @user.save
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: @user.errors.messages }, status: :unprocessable_entity
    end
  end

  # PUT /users/{name}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
    render json: @user, status: :ok
  end

  # DELETE /users/{name}
  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by(name: params[:name])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(
      :name, :email, :password, :password_confirmation
    )
  end

  def valid_user?
    return false if user_params[:name].blank?
    return false if user_params[:password].blank? || user_params[:email].blank?

    true
  end
end
