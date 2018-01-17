class Api::UsersController < ApplicationController
  # user won't be valid yet if creating new account
  before_action :validate_current_user, :except => [:create]
end
