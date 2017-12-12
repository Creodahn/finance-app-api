class Api::UsersController < ApplicationController
  # user won't be valid yet if creating new account
  skip_before_action :validate_current_user, :only => [:create]
end
