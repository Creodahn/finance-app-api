class User < ActiveRecord::Base
  validates :password_digest, presence: true, length: { minimum: 8 }

  has_one :profile

  has_secure_password

  def find_by_auth_token(token)
    unless token.nil?
      begin
        return User.find_by(auth_token: token)
      rescue
        return nil
      end
    end
  end

  def username
    p = self.profile
    p.nil? ? nil : p.email
  end

  def User.find_by_username(username)
    p = Profile.find_by(email: username)

    p.nil? ? nil : p.user
  end

  #returns the hash digest of the given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.base64(12)
  end

  def generate_auth_token
    token = User.new_token

    self.update_columns(authenticated_at: DateTime.now, auth_token: token)

    token
  end

  def invalidate_auth_token
    self.update_columns(authenticated_at: nil, auth_token: nil)
  end
end
