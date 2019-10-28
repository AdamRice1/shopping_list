class ItemsController < ApplicationController
  def create_item
    if session[:user_id] != nil
    @ao = AccountOwner.find(session[:user_id])
    puts '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
    puts @ao
    @item = List.new
    @item.item = params[:item]
    @item.quantity = params[:quantity].to_i
    @item.user = User.find(session[:user_id])
    @item.account_owner = @ao
    else
      @user = User.find(session[:user2_id])
      @ao = AccountOwner.find(@user.account_owner.id)
      @item = List.new
      @item.item = params[:item]
      @int = params[:quantity]
      @item.quantity = @int.to_i
      @item.user = @user
      @item.account_owner = @ao
    end
    if @item.valid?
      @item.save
      puts @item
      redirect_to '/list'
    else
      redirect_to '/list', alert: @item.errors.full_messages
    end
  end

  def destroy
    @item = List.find(params[:id])
    @item.destroy
    redirect_to '/list'
  end

  def list
    if session[:user_id] == nil and session[:user2_id] == nil
      redirect_to '/home', alert: ['No, no, no']
    else
      if session[:user2_id] != nil
        @x = User.find(session[:user2_id])
        puts '###################################################'
        @items = List.all
        puts @items
        render 'list'
      else
        @x = AccountOwner.find(session[:user_id])
        @items = List.where(account_owner: @x)
        p '*********************************************'
        p @x
        render 'list'
      end
    end
  end

  def new_user
    if session[:user_id] == nil
      redirect_to '/'
    else
    @ao = AccountOwner.find(session[:user_id])
    @users = User.where(account_owner: @ao)
    puts '***************************************************'
    puts @users
    puts @single
    render 'new_user'
    end
  end
end
