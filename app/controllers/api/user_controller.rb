class Api::UsersController < ApplicationController
  skip_before_action :validate_current_user, :only => [:create]

  def create
    user = User.new(password: params[:data][:attributes][:password])

    user.save
    # if user.save
      # user.generate_auth_token
    # else
    #   render_error
    # end
  end

  private

  def render_error
    render json: { errors: [ { detail: "Could not create user" } ], status: 422 }
  end
end
