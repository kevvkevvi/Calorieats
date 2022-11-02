require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
describe User do
  describe '.bmi_classifier' do
    let!(:user1) { FactoryGirl.create(:user, username: 'joe', password_digest: '123', weight: '90', height: '200', age: '19') }
    let!(:user2) { FactoryGirl.create(:user, username: 'jane', password_digest: '123', weight: '40', height: '165', age: '29') }
    let!(:user3) { FactoryGirl.create(:user, username: 'john', password_digest: '123', weight: '80', height: '170',age: '21') }
    let!(:user4) { FactoryGirl.create(:user, username: 'jim', password_digest: '123', weight: '85', height: '160', age: '28') }

    context 'healthy' do
      it 'bmi is between 18.5 and 24.9' do
        bmi = user1.weight/(user1.height/100)**2
        bmi_result = User.bmi_classifier(bmi, user1.age)
        expect(bmi_result).to eql('healthy')
        expect(User.sports_recommendation(bmi_result)).to eql('Keep a balance of aerobic and anaerobic exercise such as jogging, swimming and pump iron')
      end
      it 'bmi is lower than 18.5' do
        bmi = user2.weight/(user2.height/100)**2
        bmi_result = User.bmi_classifier(bmi, user2.age)
        expect(User.bmi_classifier(bmi, user2.age)).to eql('underweight')
        expect(User.sports_recommendation(bmi_result)).to eql('Do more anaerobic exercise to increase your muscle such as push up and pump iron')
      end
      it 'bmi is between 24.9 and 29.9' do
        bmi = user3.weight/(user3.height/100)**2
        bmi_result = User.bmi_classifier(bmi, user3.age)
        expect(User.bmi_classifier(bmi, user3.age)).to eql('overweight')
        expect(User.sports_recommendation(bmi_result)).to eql('Do more aerobic exercise to reduce your body fat as jogging and swimming')
      end
      it 'bmi is higher than 29.9' do
        bmi = user4.weight/(user4.height/100)**2
        expect(User.bmi_classifier(bmi, user4.age)).to eql('obese')
      end
    end
  end
end