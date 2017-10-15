class SubscriptionsController < ApplicationController
  include SubscriptionsHelper

  get '/subscriptions' do
    @subscriptions = Subscription.all.order("updated_at DESC").paginate(page: params[:page], per_page: 5)
    erb :'subscriptions/index'
  end

  # NEW: subscriptions new
  get '/subscriptions/new' do

    if !logged_in
      @alert_msg[:danger_alert] = "Please login to choose new subscriptions."
      erb :'users/login'
    else
      @subscription = Subscription.new  ## Prevents errors on Form Partial.
      erb :'subscriptions/new'
    end

  end

  # CREATE:
  post '/subscriptions' do
    @subscription = Subscription.create(params[:subscription])
    redirect '/subscriptions'
  end


  #### TESTING ####
  get '/subscriptions/user_subs' do
    if !logged_in
      @alert_msg[:danger_alert] = "Please login to view your subscriptions."
      erb :'users/login'
    else
      # binding.pry
      erb :'subscriptions/user_subs'
    end

  end

  delete '/subscriptions/remove_channel/:id' do
    channel_id = params[:id]
    Subscription.find_by(user_id: @user.id, channel_id: channel_id).destroy!
    @alert_msg[:danger_alert] = "Selected Channel Has Been Removed."
    erb :'subscriptions/user_subs'
  end


  post '/subscriptions/add_channel/:id' do
    channel_id = params[:id]
    Subscription.find_or_create_by(user_id: @user.id, channel_id: channel_id)
    @alert_msg[:success_alert] = "Selected Channel Has Been Added."
    erb :'subscriptions/user_subs'

  end






  # SHOW: displays a single subscription detail page.
  get '/subscriptions/:id' do
    @subscription = Subscription.find(params[:id])
    erb :'subscriptions/show'
  end

  # EDIT:
  get '/subscriptions/:id/edit' do
    @subscription = Subscription.find(params[:id])
    erb :'subscriptions/edit'
  end

  ##### Update Method (patch or put) ####

  # UPDATE: Method for patch and put
  def update_subscription
    @subscription = Subscription.find(params[:id])
    @subscription.update(params[:subscription])
    redirect "/subscriptions/#{@subscription.id}"
  end

  # UPDATE: patch
  patch '/subscriptions/:id' do
    update_subscription
  end

  # UPDATE: put
  put '/subscriptions/:id' do
    update_subscription
  end

  # DELETE:
  delete '/subscriptions/:id' do
    Subscription.find(params[:id]).destroy!
    redirect '/subscriptions'
  end


end
