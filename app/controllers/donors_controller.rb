class DonorsController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/donors/signup'
    else
      redirect '/donations'
    end
  end

  post '/donors' do
    # binding.pry
    donor = Donor.new(params)
    if donor.save
      session[:user_id] = donor.id
      redirect '/donations'
    else
      flash[:message] = 'Please fill all the required fields.'
      erb :'/donors/signup'
    end
  end

  get '/donors' do
    if logged_in?
      @donors = Donor.all
      erb :'/donors/index'
    else
      redirect '/login'
    end
  end

  get '/donors/:id' do
    @donor = Donor.find(params[:id])
    if logged_in?
      erb :'/donors/show'
    else
      redirect '/login'
    end
  end

end
