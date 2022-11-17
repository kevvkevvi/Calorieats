require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

describe MarketController do
    describe 'GET market#login' do
        it 'should redirect to login page' do
            # expect(response).to redirect_to(users_login_path)
            # expect(response).to render_template('login')
            @request.session['current_user']=nil
            get :index
            expect(response).to redirect_to(users_login_path)
        end
    end
    
    describe 'GET market#index' do      
        let!(:user1) { FactoryGirl.create(:user, username: 'joe', password_digest: '123', 'gender': 'Male', weight: '90', height: '200', age: '19', sports_level: 'Active', :id => 1) }
        
        it 'should add food to cart' do
            @request.session['current_user'] = 1
            get :index
            expect(response).to render_template('index')
        end

    end


    describe 'POST market#cart' do 
        let!(:user1) { FactoryGirl.create(:user, username: 'joe', password_digest: '123', 'gender': 'Male', weight: '70', height: '180', age: '22', sports_level: 'Active', :id => 1) }
        it "should give the food cost and total calories" do 
            @request.session['current_user'] = 1
            post :cart, {:user=>{:number1=>3, :number2=>2, :number3=>3, :number4=>1, :number5=>1, :number6=>1, :number7=>1}}
            
            expect(assigns(:pay1)).to eql("beef(1lb):3")
            expect(assigns(:pay2)).to eql("lamb(1lb):2")
            expect(assigns(:pay3)).to eql("broccoli(1lb):3") 
            expect(assigns(:pay2)).to eql("lamb(1lb):2")
            expect(assigns(:pay4)).to eql("carrot(1lb):1")
            expect(assigns(:pay5)).to eql("milk(1lb):1")
            expect(assigns(:pay6)).to eql("banana(1lb):1")
            expect(assigns(:pay7)).to eql("apple(1lb):1")

            expect(assigns(:cash).round(2)).to eql(98.0)
            expect(assigns(:calory)).to eql(8375)
           
        end
    end

    describe 'POST market#cart' do 
        let!(:user1) { FactoryGirl.create(:user, username: 'joe', password_digest: '123', 'gender': 'Male', weight: '70', height: '180', age: '22', sports_level: 'Active', :id => 1) }
        it "should give the food cost and total calories" do 
            @request.session['current_user'] = 1
            post :cart, {:user=>{:number1=>0, :number2=>0, :number3=>0, :number4=>0, :number5=>0, :number6=>0, :number7=>0}}
            
            expect(assigns(:pay)).to eql("False")
           
        end
    end
end


