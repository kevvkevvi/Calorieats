require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
describe Market do
  describe '.recommended_food' do
    #let!(:user1) { FactoryGirl.create(:user, beef: '3', lamb: '2', broccoli: '3', carrot: '1', milk: '1', banana:'1', apple: '1') }
    let!(:user1) { FactoryGirl.create(:user, username: 'joe', password_digest: '123', weight: '90', height: '200', age: '19') }
    let!(:user2) { FactoryGirl.create(:user, username: 'jane', password_digest: '123', weight: '40', height: '165', age: '29') }
    let!(:user3) { FactoryGirl.create(:user, username: 'john', password_digest: '123', weight: '80', height: '170',age: '21') }
    let!(:user4) { FactoryGirl.create(:user, username: 'jim', password_digest: '123', weight: '85', height: '160', age: '28') }

    
      #cash=user1.beef*14.99+user1.lamb*19.99+user1.broccoli*2.2+user1.carrot*0.52+user1.milk*2.65+user1.banana*0.79+user1.apple*2.49
      #calory=user1.beef*1250+user1.lamb*1331+user1.broccoli*153+user1.carrot*186+user1.milk*677+user1.banana*404+user1.apple*237
      #expect(cash).to eql('97.99999999999999')
      #expect(calory).to eql('8375')


    context 'Balanced diet of protein, vegetable, fruit and dairy' do
      it 'bmi is between 18.5 and 24.9' do
        expect(bmi_result).to eql('healthy')
        expect(Market.recommended_food(bmi_result, sports_level, weight)).to eql('Balanced diet of protein, vegetable, fruit and dairy')
      end
      it 'bmi is lower than 18.5' do
        expect(bmi_result).to eql('underweight')
        expect(Market.recommended_food(bmi_result, sports_level, weight)).to eql('More protein such as beef')
      end
      it 'bmi is between 24.9 and 29.9' do

        expect(bmi_result).to eql('overweight')
        expect(Market.recommended_food(bmi_result, sports_level, weight)).to eql('More vegetable and fruit such as broccoli and banana')
      end
      it 'bmi is higher than 29.9' do
        expect(bmi_result).to eql('obese')
      end         
    end
  end
end