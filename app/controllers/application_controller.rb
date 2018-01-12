class ApplicationController < JSONAPI::ResourceController
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :null_session
  before_action :validate_current_user
  # skip_before_action :ensure_valid_accept_media_type, if: "Rails.env.development?"

  def context
    { current_user: current_user, token: token }
  end

  private

  def token
    pattern = /^Bearer /
    header = request.env['HTTP_AUTHORIZATION']
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def current_user
    authenticate_token
  end

  def authenticate_token
    return User.find_by(auth_token: token)
  end

  def render_unauthorized
    render json: { errors: [ { detail: "Access denied" } ] }, status: 401
  end

  def validate_current_user
    u = authenticate_token
    render_unauthorized unless u.present?
  end
end
