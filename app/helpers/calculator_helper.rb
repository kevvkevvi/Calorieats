module CalculatorHelper
    def sports_recommendation(bmi_result)
        if bmi_result == 'healthy'
            'Keep a balance of aerobic and anaerobic exercise such as jogging, swimming and pump iron'
        elsif bmi_result == 'underweight'
            'Do more anaerobic exercise to increase your muscle such as push up and pump iron'
        else bmi_result == 'overweight'
            'Do more aerobic exercise to reduce your body fat as jogging and swimming'
        end 
    end
end
