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
            post :cart, {:user=>{:n1=>"3", :n2=>"2", :n3=>"3", :n4=>"1", :n5=>"1", :n6=>"1", :n7=>"1"}}
            expect(assigns(:calories)).to eql(8375)
            expect(assigns(:cash)).to eql(97.99999999999999)
            
        end
    end
end


