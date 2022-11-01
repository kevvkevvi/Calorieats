require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
describe User do
  describe '.bmi_classifier' do
    let!(:user1) { FactoryGirl.create(:user, username: 'joe', password_digest: '123', bmi: '20', age: '23') }
    let!(:user2) { FactoryGirl.create(:user, username: 'jane', password_digest: '123', bmi: '17', age: '23') }
    let!(:user3) { FactoryGirl.create(:user, username: 'john', password_digest: '123', bmi: '28', age: '23') }
    let!(:user4) { FactoryGirl.create(:user, username: 'john', password_digest: '123', bmi: '29', age: '23') }

    context 'healthy' do
      it 'bmi is between 18.5 and 24.9' do
        expect(User.bmi_classifier(user1.bmi)).to eql(['20'])
      end
    end
  end
end