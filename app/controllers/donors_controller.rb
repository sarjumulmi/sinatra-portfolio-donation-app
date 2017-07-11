class DonorsController < ApplicationController

    get '/signup' do
      if !logged_in?
        erb :'/donors/signup'
      else
        redirect '/donations'
      end
    end

end
