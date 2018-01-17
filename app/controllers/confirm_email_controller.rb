class ConfirmEmailController < ActionController::Base
  def show
    render json: { data: [Profile.exists?(email: params[:email])] }
  end
end
