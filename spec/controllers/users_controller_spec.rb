require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

describe UsersController do
    # describe 'GET users#login' do
    #     it 'should bring to login page' do
    #         get :login
    #         # pathname = URI.parse(current_url).path
    #         expect(response).to have_http_status(200)
    #     end
    # end

    describe 'GET users#registerprocess' do
        # before do
        #     put 'update', params: { id: 3, user: { email: 'newmail@ya.ru'} }
        # end
        it 'prints user params' do
            expect do
                UsersController.registerprocess
            end.to output('').to_stdout
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