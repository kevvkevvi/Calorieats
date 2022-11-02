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

    def self.sports_recommendation(bmi_result)
        if bmi_result == 'healthy'
            'Keep a balance of aerobic and anaerobic exercise such as jogging, swimming and pump iron'
        elsif bmi_result == 'underweight'
            'Do more anaerobic exercise to increase your muscle such as push up and pump iron'
        else 
            'Do more aerobic exercise to reduce your body fat as jogging and swimming'
        end 
    end

end