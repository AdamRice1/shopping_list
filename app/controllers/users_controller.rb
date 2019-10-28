class UsersController < ApplicationController
  def create_ao
    if params['ao']['password'] == params['ao']['confirm_password']
      @ao = AccountOwner.create ( user_params )
      @ao.user_level = 1
      if @ao.valid?
        @ao.save
        session[:user_id] = AccountOwner.last.id
        redirect_to '/list'
      else
        redirect_to '/', alert: @ao.errors.full_messages
      end
    else
      redirect_to '/', alert: ['Passwords must match!']
    end
  end

  def create_user
    if params['user']['password'] == params['user']['confirm_password']
      @user = User.create ( sub_user_params )
      @user.user_level = 2
      @ao = AccountOwner.find(session[:user_id])
      @user.account_owner = @ao
      if @user.valid?
        @user.save
        puts '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
        puts @user
        redirect_to '/users'
      else 
        redirect_to '/users', alert: @user.errors.full_messages
      end
    else
      redirect_to '/users', alert: ['Passwords must match!']
    end
  end

  def login
    @ao = AccountOwner.find_by_email(params['email_login'])
    if @ao == nil
      puts '**************************************************'
      puts @ao
      redirect_to '/', alert: ['No Account Owner Found With that Information']
    else
      puts '**************************************************'
      puts @ao
      puts @ao.id
      @ao.authenticate(params['password_login'])
      session[:user_id] = @ao.id
      redirect_to '/list'
    end
  end
  def login_user
    @ao = User.find_by_email(params['email_login2'])
    if @ao == nil
      puts '**************************************************'
      puts @ao
      redirect_to '/', alert: ['No Account Owner Found With that Information']
    else
      puts '**************************************************'
      puts @ao
      puts @ao.id
      @ao.authenticate(params['password_login2'])
      session[:user2_id] = @ao.id
      redirect_to '/list'
    end
  end

  def logout
    session[:user2_id] = nil
    session[:user_id] = nil
    redirect_to '/home'
  end
  def home
    session[:user2_id] = nil
    session[:user_id] = nil
    render 'login'
  end
  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to '/users'
  end
  private
  def user_params
    params.require(:ao).permit(:first_name, :last_name, :email, :password)
  end
  private
  def sub_user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
