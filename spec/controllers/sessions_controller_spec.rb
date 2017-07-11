require 'spec_helper'

describe "Sessions Controller" do

  describe '/login' do
    it 'loads the login page' do
      get '/login'
      expect(last_response.status).to eq(200)
    end

    it 'loads /donations after login' do
      Donor.create(:name=>'john', :email=>'a@b.com', :password=>'test')
      visit('/login')
      fill_in('email', :with=>'a@b.com')
      fill_in('password', :with=>'test')
      click_button('Submit')
      expect(page.current_path).to eq('/donations')
    end

    it 'does not let the user view login page if already loggen in' do
      Donor.create(:name=>'john', :email=>'a@b.com', :password=>'test')
      visit('/login')
      fill_in('email', :with=>'a@b.com')
      fill_in('password', :with=>'test')
      click_button('Submit')
      visit('/login')
      # need to setup session[user_id] manually???
      expect(last_response.location).to include("/donations")
    end
  end

end
