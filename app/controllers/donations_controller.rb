class DonationsController < ApplicationController

  get '/donations' do
    erb :'/donations/index'
  end

end
