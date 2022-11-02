require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

describe CalculatorHelper do 
  # let!(:bmi_result1) { FactoryGirl.create(:bmi_result, result: 'healthy', :id => 1) }
  describe '.sports_recommendation' do
    it 'input is healthy' do 
      expect(sports_recommendation('healthy')).to eq('Keep a balance of aerobic and anaerobic exercise such as jogging, swimming and pump iron')
    end
    it 'input is underweight' do 
      expect(sports_recommendation('underweight')).to eq('Do more anaerobic exercise to increase your muscle such as push up and pump iron')
    end
    it 'input is overweight' do 
      expect(sports_recommendation('overweight')).to eq('Do more aerobic exercise to reduce your body fat as jogging and swimming')
    end
  end
end