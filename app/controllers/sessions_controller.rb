class SessionsController < ApplicationController

  get '/login' do
    if !logged_in?
      erb :'/sessions/login'
    else
      redirect :'/donors'
    end
  end

  post '/sessions' do
    # binding.pry
    donor = Donor.find_by(:email=>params[:email])
    if donor && donor.authenticate(params[:password])
      session[:user_id] = donor.id
        # binding.pry
      redirect '/donors'
    else
      flash[:message] = 'Invalid Credentials.'
      redirect '/login'
    end

  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
