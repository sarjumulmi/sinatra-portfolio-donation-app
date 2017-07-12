class CharitiesController < ApplicationController

  get '/charities' do
    if logged_in?
      @charities = Charity.all
      erb :'/charities/index'
    else
      redirect '/login'
    end
  end

end
