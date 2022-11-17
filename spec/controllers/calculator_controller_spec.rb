require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

describe CalculatorController do
    describe 'GET calculator#login' do
        it 'should redirect to login page' do
            # expect(response).to redirect_to(users_login_path)
            # expect(response).to render_template('login')
            @request.session['current_user']=nil
            get :index
            expect(response).to redirect_to(users_login_path)
        end
    end
    
    describe 'GET calculator#index' do
        let!(:user1) { FactoryGirl.create(:user, username: 'joe', password_digest: '123', 'gender': 'Male', 
                        weight: '90', height: '200', age: '19', sports_level: 'Active', :id => 1) }

        it "should fill in the last input by the user" do
            @request.session['current_user'] = 1
            get(:index)
            expect(assigns(:gender)).to eql('Male') 
            expect(assigns(:sports_level)).to eql('Active') 
        end
    end

    describe 'POST calculator#index' do 
        let!(:user1) { FactoryGirl.create(:user, username: 'joe', password_digest: '123', 'gender': 'Male', 
        weight: '70', height: '180', age: '22', sports_level: 'Active', :id => 1) }

        it "should give the right bmi result and food recommendation" do 
            @request.session['current_user'] = 1
            post :recommendation, {:user=>{:height=>"-20", :weight=>"90", :age=>"20"},
                                     :gender=>"Male", :sports_level=>"Active"}
            expect(assigns(:bmi)).to eql(0)
            expect(assigns(:bmi_result)).to eql("NaN")
        end
    end

    describe 'POST calculator#index' do 
        let!(:user1) { FactoryGirl.create(:user, username: 'joe', password_digest: '123', 'gender': 'Male', 
        weight: '70', height: '180', age: '22', sports_level: 'Active', :id => 1) }

        it "should give the right bmi result and food recommendation" do 
            @request.session['current_user'] = 1
            post :recommendation, {:user=>{:height=>"200", :weight=>"-90", :age=>"20"},
                                    :gender=>"Male", :sports_level=>"Active"}
            expect(assigns(:bmi)).to eql(0)
            expect(assigns(:bmi_result)).to eql("NaN")
        end
    end

    describe 'POST calculator#index' do 
        let!(:user1) { FactoryGirl.create(:user, username: 'joe', password_digest: '123', 'gender': 'Male', 
        weight: '70', height: '180', age: '22', sports_level: 'Active', :id => 1) }

        it "should give the right bmi result and food recommendation" do 
            @request.session['current_user'] = 1
            post :recommendation, {:user=>{:height=>"200", :weight=>"90", :age=>"-20"},
                                    :gender=>"Male", :sports_level=>"Active"}
            expect(assigns(:bmi)).to eql(0)
            expect(assigns(:bmi_result)).to eql("NaN")
        end
    end

    describe 'POST calculator#index' do 
        let!(:user1) { FactoryGirl.create(:user, username: 'joe', password_digest: '123', 'gender': 'Male', 
        weight: '70', height: '180', age: '22', sports_level: 'Active', :id => 1) }

        it "should give the right bmi result and food recommendation" do 
            @request.session['current_user'] = 1
            post :recommendation, {:user=>{:height=>"200", :weight=>"90", :age=>"20"},
                                     :gender=>"Male", :sports_level=>"Active"}
            expect(assigns(:bmi)).to eql(22.5)
            expect(assigns(:bmi_result)).to eql("healthy")
        end
        # it "should give update the user info" do
        #     @request.session['current_user'] = 1
        #     get(:index)
        #     expect(assigns(:gender)).to eql('Male') 
        #     expect(assigns(:sports_level)).to eql('Active') 
        # end
    end
end

