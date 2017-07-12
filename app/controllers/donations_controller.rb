class DonationsController < ApplicationController

  get '/donations/new' do
    if logged_in?
      erb :'/donations/new'
    else
      redirect '/login'
    end

  end

end
