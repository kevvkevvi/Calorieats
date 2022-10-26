class UsersController < ApplicationController
  def login
  end

  def register
  end

  def logout
    session['current_user'] = nil
    redirect_to users_login_path
  end

  def loginprocess
    puts params[:user][:username]
    user = User.auth_login(params[:user][:username], params[:user][:password])
    if user 
        session['current_user'] = user.id 
        redirect_to calculator_index_path
    else 
        flash[:notice] = "Username or password not correct"
        redirect_to users_login_path
    end 
  end

  def registerprocess
    puts params[:user][:username]
    user_exists = User.auth_register(params[:user][:username])
    if not user_exists 
        @user_hash = {'username' => params[:user][:username], 'password_digest' => params[:user][:password]}
        @user = User.create!(@user_hash)
        session['current_user'] = @user.id
        flash[:notice] = "Hi #{params[:user][:username]}, you have successfully registered."
        redirect_to calculator_index_path
    else 
        flash[:notice] = "Username #{params[:user][:username]} already exists"
        redirect_to users_login_path
    end 
  end

end
