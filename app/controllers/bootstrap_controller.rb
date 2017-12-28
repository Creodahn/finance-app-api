class BootstrapController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    if Rails.env.development?
      render :development
    else
      uri = URI.parse(ENV["REDIS_URL"])
      redis = Redis.new(:url => uri)

      revision = redis.get("finance-app:index:current")
      if params[:revision]
        revision = params[:revision]
        logger.debug "Using revision #{revision}"
      end

      html = redis.get("finance-app:index:#{revision}")
      render :text => html
    end
  end
end
