class ChannelsController < ApplicationController
  include ChannelsHelper
  include SubscriptionsHelper


  # INDEX: channels view all.
  get '/channels' do
    # @channels = Channel.order('updated_at ASC').limit(10)
    @channels = Channel.all.order("name ASC").paginate(page: params[:page], per_page: 5)
    erb :'channels/index'
  end

  # NEW: channels new
  get '/channels/new' do
    if !logged_in
      @alert_msg[:danger_alert] = "Please login to choose new channels."
      erb :'users/login'
    else
      @channel = Channel.new  ## Prevents errors on Form Partial.
      erb :'channels/new'
    end
  end

  # CREATE:
  post '/channels' do
    @channel = Channel.create(params[:channel])
    redirect '/channels'
  end

  # SHOW: displays a single channel detail page.
  get '/channels/:id' do
    @channel = Channel.find(params[:id])
    erb :'channels/show'
  end

  # EDIT:
  get '/channels/:id/edit' do
    @channel = Channel.find(params[:id])
    erb :'channels/edit'
  end

  ##### Update Method (patch or put) ####

  # UPDATE: Method for patch and put
  def update_channel
    @channel = Channel.find(params[:id])
    @channel.update(params[:channel])
    redirect "/channels/#{@channel.id}"
  end

  # UPDATE: patch
  patch '/channels/:id' do
    update_channel
  end

  # UPDATE: put
  put '/channels/:id' do
    update_channel
  end

  #################################

  # DELETE:
  delete '/channels/:id' do
    Channel.find(params[:id]).destroy!
    redirect '/channels'
  end

  # helpers do
  #
  #   def channel_user_status(channel_id, user)
  #     user.subscriptions.find_by(channel_id: channel_id).present?
  #   end
  #
  # end




end
