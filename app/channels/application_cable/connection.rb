module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected
    # Devise uses warden – it assigns to env[‘warden’] variable all information about the session and authentication.
    # By calling a env[‘warden’].user, you can get a current user
    def find_verified_user
      if (current_user = env['warden'].user)
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
