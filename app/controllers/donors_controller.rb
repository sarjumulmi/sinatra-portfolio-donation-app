class DonorsController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/donors/signup'
    else
      redirect '/donors'
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

  get '/donors/:id/edit' do
    if logged_in?
      @donor = Donor.find(params[:id])
      erb :'/donors/edit'
    else
      redirect '/login'
    end
  end

  patch '/donors/:id' do
    # binding.pry
    current_user.update(:name=>params[:name])
    redirect "/donors/#{current_user.id}"
  end

end
