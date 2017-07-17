class DonationsController < ApplicationController

  get '/donations/new' do
    if logged_in?
      erb :'/donations/new'
    else
      redirect '/login'
    end
  end

  post '/donations' do
    # binding.pry
    # params = {"charity_id"=>"1", "item"=>"somthing", "item_price"=>"4000"}
    #=> check if you can save donation, if not use flahs message
    donation = Donation.new(:item=>params[:item], :item_price=>params[:item_price].to_i)
    if donation.save
      # binding.pry
      donation.donor = current_user
      donation.charity = Charity.find(params[:charity_id])
      donation.save
      redirect "/donors/#{current_user.id}"
    else
      flash[:message] = "Please fill all the fields."
      erb :'/donations/new'
    end



  end

end
