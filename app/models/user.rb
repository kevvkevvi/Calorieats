class User < ActiveRecord::Base
    def self.auth_login(username, password)
        user = User.find_by(username: username, password_digest: password)
    end

    def self.auth_register(username)
        user = User.find_by(username: username)
    end
end