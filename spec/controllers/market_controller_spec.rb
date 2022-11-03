require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

describe MarketController do
    describe 'GET market#index' do      
        it 'should add food to cart' do
            get :index
            expect(response).to render_template('index')
        end

    end


    describe 'POST market#cart' do 
        let!(:user1) { FactoryGirl.create(:user, username: 'joe', password_digest: '123', 'gender': 'Male', weight: '70', height: '180', age: '22', sports_level: 'Active', :id => 1) }
        it "should give the food cost and total calories" do 
            @request.session['current_user'] = 1
            post :cart, {:user=>{:number1=>3, :number2=>2, :number3=>3, :number4=>1, :number5=>1, :number6=>1, :number7=>1}}
            
            expect(assigns(:cash)).to eql(97.99999999999999)
            expect(assigns(:calory)).to eql(8375)
        end
    end
end


