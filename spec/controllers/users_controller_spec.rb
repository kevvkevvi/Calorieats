require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

describe UsersController do
    describe 'GET users#login' do
        it 'should render the login template' do
            get :login
            # pathname = URI.parse(current_url).path
            expect(response).to render_template('login')
        end
    end

    describe 'GET users#registerprocess' do
        it 'redirects to the calculator index page if the user does not exists' do
            post :registerprocess, user: FactoryGirl.attributes_for(:user)
            expect(response).to redirect_to(calculator_index_path)
        end
        # it 'redirects to the login page if the username already exists' do
        #     post :registerprocess, user: FactoryGirl.attributes_for(:user)
        #     expect(response).to redirect_to(users_login_path)
        # end
    end

    describe 'GET users#loginprocess' do
        # it 'redirects to the calculator index page if we have a user' do
        #     post :loginprocess, user: FactoryGirl.attributes_for(:user)
        #     expect(response).to redirect_to(calculator_index_path)
        # end
        it 'redirects to the login page if we do not have a user' do
            post :loginprocess, user: FactoryGirl.attributes_for(:user)
            expect(response).to redirect_to(users_login_path)
        end
    end

    # describe 'GET logout' do
    #     it 'should redirect to login page' do
    #         # expect(response).to redirect_to(users_login_path)
    #         # expect(response).to render_template('login')
    #         get :session
    #         expect(session['current_user']).to eq(nil)
    #     end
    # end
end