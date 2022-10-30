class User < ActiveRecord::Base
    def self.auth_login(username, password)
        user = User.find_by(username: username, password_digest: password)
    end

    def self.auth_register(username)
        user = User.find_by(username: username)
    end

    def self.bmi_classifier(bmi, age)
        # age not yet considered
        if bmi >= 18.5 and bmi <= 24.9
            'healthy'
        elsif bmi < 18.5 
            'underweight'
        elsif bmi > 24.9 and bmi <= 29.9
            'overweight'
        elsif bmi > 29.9 
            'obese'
        end
    end

end