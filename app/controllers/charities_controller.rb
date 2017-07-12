class CharitiesController < ApplicationController

  get '/charities' do
    if logged_in?
      erb :'/charities/index'
    else
      redirect '/login'
    end
  end

end
